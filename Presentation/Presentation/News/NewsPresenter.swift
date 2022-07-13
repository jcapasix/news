//
//  NewsPresenter.swift
//  Presentation
//
//  Created by Jordan Capa on 12-07-22.
//

import UIKit
import Data
import Domain
 
protocol NewsPresenterPortocol {
    var interactor: NewsInteractorProtocol? { get set }
    func fetchNews()
}
 
class NewsPresenter: NewsPresenterPortocol {
    
    weak var view: NewsViewProtocol?
    var interactor: NewsInteractorProtocol?
    
    public init(interactor: NewsInteractorProtocol?, view: NewsViewProtocol?) {
        self.interactor = interactor
        self.view = view
    }
    
    func fetchNews() {
        interactor?.fetchNews { [weak self] response in
            if let response = response {
                self?.view?.showNews(news: response)
            }
        }
    }
}

