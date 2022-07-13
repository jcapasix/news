//
//  NewsInteractorProtocol.swift
//  Data
//
//  Created by Jordan Capa on 11-07-22.
//

import Data

public protocol NewsInteractorProtocol {
    var repository: NewsRepositoryProtocol? {get set}
    func fetchNews(completion: @escaping ([NewsViewModel]?)-> Void)
}
