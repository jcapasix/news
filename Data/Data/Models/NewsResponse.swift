//
//  NewsResponse.swift
//  Data
//
//  Created by Jordan Capa on 12-07-22.
//

import Foundation

// MARK: - NewsResponse
public struct NewsResponse: Codable {
    public let hits: [Hit]
    public let nbHits, page, nbPages, hitsPerPage: Int
    public let exhaustiveNbHits, exhaustiveTypo: Bool
    public let query, params: String
    public let processingTimeMS: Int

    public init(hits: [Hit], nbHits: Int, page: Int, nbPages: Int, hitsPerPage: Int, exhaustiveNbHits: Bool, exhaustiveTypo: Bool, query: String, params: String, processingTimeMS: Int) {
        self.hits = hits
        self.nbHits = nbHits
        self.page = page
        self.nbPages = nbPages
        self.hitsPerPage = hitsPerPage
        self.exhaustiveNbHits = exhaustiveNbHits
        self.exhaustiveTypo = exhaustiveTypo
        self.query = query
        self.params = params
        self.processingTimeMS = processingTimeMS
    }
}

// MARK: - Hit
public struct Hit: Codable {
    public let createdAt: String?
    public let title, url: String?
    public let author: String?
    public let points: Int?
    public let storyText: String?
    public let commentText: String?
    public let numComments: Int?
    public let storyID: Int?
    public let storyTitle: String?
    public let storyURL: String?
    public let parentID, createdAtI: Int?
    public let tags: [String]?
    public let objectID: String?
    public let highlightResult: HighlightResult?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title, url, author, points
        case storyText = "story_text"
        case commentText = "comment_text"
        case numComments = "num_comments"
        case storyID = "story_id"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case parentID = "parent_id"
        case createdAtI = "created_at_i"
        case tags = "_tags"
        case objectID
        case highlightResult = "_highlightResult"
    }

    public init(createdAt: String?, title: String?, url: String?, author: String?, points: Int?, storyText: String?, commentText: String?, numComments: Int?, storyID: Int?, storyTitle: String?, storyURL: String?, parentID: Int?, createdAtI: Int?, tags: [String]?, objectID: String?, highlightResult: HighlightResult?) {
        self.createdAt = createdAt
        self.title = title
        self.url = url
        self.author = author
        self.points = points
        self.storyText = storyText
        self.commentText = commentText
        self.numComments = numComments
        self.storyID = storyID
        self.storyTitle = storyTitle
        self.storyURL = storyURL
        self.parentID = parentID
        self.createdAtI = createdAtI
        self.tags = tags
        self.objectID = objectID
        self.highlightResult = highlightResult
    }
}

// MARK: - HighlightResult
public struct HighlightResult: Codable {
    public let author, commentText, storyTitle: Author?
    public let storyURL: Author?

    enum CodingKeys: String, CodingKey {
        case author
        case commentText = "comment_text"
        case storyTitle = "story_title"
        case storyURL = "story_url"
    }

    public init(author: Author?, commentText: Author?, storyTitle: Author?, storyURL: Author?) {
        self.author = author
        self.commentText = commentText
        self.storyTitle = storyTitle
        self.storyURL = storyURL
    }
}

// MARK: - Author
public struct Author: Codable {
    public let value: String?
    public let matchLevel: MatchLevel?
    public let matchedWords: [String]?
    public let fullyHighlighted: Bool?

    public init(value: String?, matchLevel: MatchLevel?, matchedWords: [String]?, fullyHighlighted: Bool?) {
        self.value = value
        self.matchLevel = matchLevel
        self.matchedWords = matchedWords
        self.fullyHighlighted = fullyHighlighted
    }
}

public enum MatchLevel: String, Codable {
    case full = "full"
    case none = "none"
}

