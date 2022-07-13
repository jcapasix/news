//
//  NewsRepository.swift
//  Data
//
//  Created by Jordan Capa on 11-07-22.
//
import RealmSwift

public class NewsLocalRepository: NewsRepositoryProtocol {
    public init() {}
    let realm: Realm? = {
        do {
            let realm = try Realm()
            return realm
        }
        catch {
            return nil
        }
    }()
    public func fetchNews(completion: @escaping ([NewsViewModel]?)-> Void) {
        guard let realm = realm else {
            return completion(nil)
        }
        let news = realm.objects(NewsViewModel.self)
        DispatchQueue.global().sync {
            let newsModel: [NewsViewModel] = news.filter { model in
                return model.isEnabled
            }
            completion(newsModel)
        }

    }
}
 
 
