//
//  NewsInteractor.swift
//  Domain
//
//  Created by Jordan Capa on 11-07-22.
//
import Data

public class NewsInteractor: NewsInteractorProtocol {
    public var repository: NewsRepositoryProtocol?
    public init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }
    public func fetchNews(completion: @escaping ([NewsViewModel]?) -> Void) {
        repository?.fetchNews(completion: { response in
            if let response = response {
                completion(NewsViewModel.mapper(hits: response.hits))
            } else {
                completion(nil)
            }
        })
    }
}
 
