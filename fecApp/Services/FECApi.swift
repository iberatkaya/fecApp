//
//  FECApi.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/15/22.
//

import Foundation
import Alamofire

class FECApi: RequestAdapter, RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Alamofire.Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
            var urlRequest = urlRequest
            urlRequest.url?.append(queryItems: [URLQueryItem(name: "api_key", value: getAPIKey())])

            completion(.success(urlRequest))
      }
    
    let baseUrlStr = "https://api.open.fec.gov/v1/"
    
    func searchCandidate(_ name: String) async -> Result<[Candidate], APIError> {
        var url = URL(string: baseUrlStr + "candidates/search")!
        url.append(queryItems: [URLQueryItem(name: "name", value: name), URLQueryItem(name: "sort", value: "state")])
        let task = AF.request(url, interceptor: self).cacheResponse(using: .cache).serializingData()
        let res = await task.response
        if let err = res.error {
            return .failure(.genericError(err))
        }
        if let data = res.data {
            do {
                let apiData = try JSONDecoder().decode(CandidatesSearchAPIResponse.self, from: data)
                return .success(apiData.results)
            } catch {
                return .failure(.genericError(error))
            }
        }
        
        return .failure(.invalidData)
    }
}
