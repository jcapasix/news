//
//  DataConstants.swift
//  Data
//
//  Created by Jordan Capa on 12-07-22.
//

struct NetworkSettings {
    static let host = "https://hn.algolia.com/api/"
    static let apiVersion = "v1/"
}

enum EndPoints: String {
    
    case news = "search_by_date?query=mobile"
    var value: String {
        switch self {
        case .news:
            return "\(NetworkSettings.host)\(NetworkSettings.apiVersion)\(self.rawValue)"
        }
    }
}
