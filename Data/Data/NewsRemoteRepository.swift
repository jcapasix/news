//
//  NewsRemoteRepository.swift
//  Data
//
//  Created by Jordan Capa on 12-07-22.
//
import Alamofire

public class NewsRemoteRepository: NewsRepositoryProtocol {
    
    public init() {}
    
    public func fetchNews(completion: @escaping (NewsResponse?)-> Void) {
        AF.request(EndPoints.news.value,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil).responseDecodable(of: NewsResponse.self) { response in
            debugPrint(response)
            if let newsResponse = response.value {
                completion(newsResponse)
            } else {
                completion(nil)
            }
        }
    }
}
 
