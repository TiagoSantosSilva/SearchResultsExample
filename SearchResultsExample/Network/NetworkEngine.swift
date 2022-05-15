//
//  NetworkEngine.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import Foundation

enum NetworkError: String, Error {
    case responseUnwrapFail = "Response unwrap fail"
    case noData = "No data"
}

protocol NetworkEngineProtocol: AnyObject {
    func request<T: Decodable>() async throws -> T
}

final class NetworkEngine: NetworkEngineProtocol {

    // MARK: - Properties

    private lazy var decoder = JSONDecoder()

    // MARK: - Initialization

    init() { }

    // MARK: - Functions

    func request<T: Decodable>() async throws -> T {
        let request = buildRequest()
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.responseUnwrapFail
        }

        guard isResponseSuccessful(response) else { throw NetworkError.noData }
        return try decoder.decode(T.self, from: data)
    }

    private func buildRequest() -> URLRequest {
        var request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=900")!)
        request.httpMethod = "GET"
        return request
    }

    // MARK: - Private Functions

    private func isResponseSuccessful(_ response: HTTPURLResponse) -> Bool {
        switch response.statusCode {
        case ResponseCodes.successful:
            return true
        default:
            return false
        }
    }
}

private extension NetworkEngine {
    enum ResponseCodes {
        static let successful: ClosedRange<Int> = 200...299
        static let redirection: ClosedRange<Int> = 300...399
        static let clientError: ClosedRange<Int> = 400...499
        static let serverError: ClosedRange<Int> = 500...599
    }
}
