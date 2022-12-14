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
    
    func getCandidate(_ id: String) async -> Result<CandidateDetails, APIError> {
        let url = URL(string: baseUrlStr + "candidate/" + id)!
        let task = AF.request(url, interceptor: self).cacheResponse(using: .cache).serializingData()
        let res = await task.response
        if let err = res.error {
            return .failure(.genericError(err))
        }
        if let data = res.data {
            do {
                let apiData = try JSONDecoder().decode(CandidateDetailsAPIResponse.self, from: data)
                if apiData.results.count > 0 {
                    return .success(apiData.results[0])
                }
                return .failure(.dataNotFound)
            } catch {
                print(error)
                return .failure(.genericError(error))
            }
        }
        
        return .failure(.invalidData)
    }
    
    func getCandidateFinancials(_ candidateID: String) async -> Result<[CandidateFinancials], APIError> {
        var url = URL(string: baseUrlStr + "candidate/" + candidateID + "/totals")!
        url.append(queryItems: [URLQueryItem(name: "sort", value: "-cycle")])
        let task = AF.request(url, interceptor: self).cacheResponse(using: .cache).serializingData()
        let res = await task.response
        if let err = res.error {
            return .failure(.genericError(err))
        }
        if let data = res.data {
            do {
                let apiData = try JSONDecoder().decode(CandidateFinancialsAPIResponse.self, from: data)
                if apiData.results.count > 0 {
                    return .success(apiData.results)
                }
                return .failure(.dataNotFound)
            } catch {
                print(error)
                return .failure(.genericError(error))
            }
        }
        
        return .failure(.invalidData)
    }
    
    func getDonationsByState(candidateID: String, cycles: [Int]) async -> Result<[CandidateDonationsByState], APIError> {
        var url = URL(string: baseUrlStr + "schedules/schedule_a/by_state/by_candidate/")!
        url.append(queryItems: [URLQueryItem(name: "per_page", value: "\(cycles.count * 64)"), URLQueryItem(name: "candidate_id", value: candidateID), URLQueryItem(name: "sort", value: "-total")] + cycles.map({ URLQueryItem(name: "cycle", value: "\($0)") }))
        let task = AF.request(url, interceptor: self).cacheResponse(using: .cache).serializingData()
        let res = await task.response
        if let err = res.error {
            return .failure(.genericError(err))
        }
        if let data = res.data {
            do {
                let apiData = try JSONDecoder().decode(CandidateDonationsByStateAPIResponse.self, from: data)
                if let results = apiData.results, results.count > 0 {
                    return .success(results)
                }
                return .failure(.dataNotFound)
            } catch {
                print(error)
                return .failure(.genericError(error))
            }
        }
        
        return .failure(.invalidData)
    }
    
    func getCandidateFilings(candidateID: String, cycles: [Int]) async -> Result<[CandidateFiling], APIError> {
        var url = URL(string: baseUrlStr + "candidate/\(candidateID)/filings/")!
        url.append(queryItems: [URLQueryItem(name: "per_page", value: "\(cycles.count * 10)"), URLQueryItem(name: "sort", value: "-report_year")] + cycles.map({ URLQueryItem(name: "cycle", value: "\($0)") }))
        let task = AF.request(url, interceptor: self).cacheResponse(using: .cache).serializingData()
        let res = await task.response
        if let err = res.error {
            return .failure(.genericError(err))
        }
        if let data = res.data {
            do {
                let apiData = try JSONDecoder().decode(CandidateFilingAPIResponse.self, from: data)
                if let results = apiData.results, results.count > 0 {
                    return .success(results)
                }
                return .failure(.dataNotFound)
            } catch {
                print(error)
                return .failure(.genericError(error))
            }
        }
        
        return .failure(.invalidData)
    }
}
