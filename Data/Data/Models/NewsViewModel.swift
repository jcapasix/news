//
//  NewsModel.swift
//  Data
//
//  Created by Jordan Capa on 12-07-22.
//
import RealmSwift

public class NewsViewModel: Object {
    @Persisted(primaryKey: true) public var _storyId: Int
    @Persisted public var title: String
    @Persisted public var date: String
    @Persisted public var storyUrl: String
    @Persisted public var isEnabled: Bool = true
}

extension NewsViewModel {
    static func mapper(hits: [Hit]) -> [NewsViewModel] {
        return hits.compactMap { hit in
            let model = NewsViewModel()
            model._storyId = hit.storyID ?? .zero
            model.title = hit.highlightResult?.storyTitle?.value ?? DatainConstans.empty
            model.date = hit.createdAt ?? DatainConstans.empty
            model.storyUrl = hit.highlightResult?.storyURL?.value ?? DatainConstans.empty
            return model
        }
    }
}
