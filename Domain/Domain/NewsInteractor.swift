//
//  NewsInteractor.swift
//  Domain
//
//  Created by Jordan Capa on 11-07-22.
//
import Data
import RealmSwift

public class NewsInteractor: NewsInteractorProtocol {
    public var repository: NewsRepositoryProtocol?
    let realm: Realm? = {
        do {
            let realm = try Realm()
            return realm
        }
        catch {
            return nil
        }
    }()
    
    public init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }
    public func fetchNews(completion: @escaping ([NewsViewModel]?) -> Void) {
        repository?.fetchNews(completion: { response in
            if let response = response {
                self.syncNews(news: response, completion: completion)
            } else {
                completion(nil)
            }
        })
    }
    
    private func syncNews(news: [NewsViewModel], completion: @escaping ([NewsViewModel]?) -> Void) {
        guard let realm = realm else {
            return completion(nil)
        }
        for new in news {
            if realm.objects(NewsViewModel.self).filter("_storyId = \(new._storyId)").first == nil {
                addNews(new: new)
            }
        }
        let news = realm.objects(NewsViewModel.self)
        DispatchQueue.global().sync {
            let newsModel: [NewsViewModel] = news.filter { model in
                return model.isEnabled
            }
            completion(newsModel)
        }
    }
    
    private func addNews(new: NewsViewModel) {
        guard let realm = realm else {
            return
        }
        do {
            try realm.write {
                realm.add(new)
            }
        } catch {
            return
        }
    }
    
    public func removeNews(new: NewsViewModel, completion: @escaping (Bool) -> Void) {
        guard let realm = realm else {
            return completion(false)
        }
        let updateModel = NewsViewModel()
        updateModel.title = new.title
        updateModel._storyId = new._storyId
        updateModel.date = new.date
        updateModel.storyUrl =  new.storyUrl
        updateModel.isEnabled = false
        do {
            try realm.write {
                realm.add(updateModel, update: .modified)
                completion(true)
            }
        } catch {
            completion(false)
        }
        
    }
}
 
