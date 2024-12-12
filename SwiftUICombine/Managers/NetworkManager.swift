//
//  NetworkManager.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 11/12/24.
//

import Foundation
import Combine

class NetworkManager{
    static let shared = NetworkManager()
    
    private init() {}
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://a00407a8-f46e-407e-b684-5d949532e7fc.mock.pstmn.io/api/v1/employees"
    
    func getData<T: Decodable>(type: T.Type) -> Future<T, Error> {
        return Future { [weak self] promise in
            guard let self = self, let url = URL(string: self.baseURL) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                } receiveValue: {
                    promise(.success($0))
                }
                .store(in: &self.cancellables)

        }
    }
    
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
