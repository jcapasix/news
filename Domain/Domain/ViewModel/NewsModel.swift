//
//  NewsModel.swift
//  Data
//
//  Created by Jordan Capa on 12-07-22.
//
import Data

public struct NewsViewModel {
    public var title: String
    public var date: String
    public var storyUrl: String
}

extension NewsViewModel {
    static func mapper(hits: [Hit]) -> [NewsViewModel] {
        return hits.compactMap { hit in
            NewsViewModel(title: hit.highlightResult?.storyTitle?.value ?? "", date: hit.createdAt ?? "", storyUrl: hit.highlightResult?.storyURL?.value ?? "")
        }
    }
}
