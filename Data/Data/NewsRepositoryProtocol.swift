//
//  NewsRepositoryProtocol.swift
//  Data
//
//  Created by Jordan Capa on 12-07-22.
//

public protocol NewsRepositoryProtocol {
    func fetchNews(completion: @escaping (NewsResponse?)-> Void)
}
