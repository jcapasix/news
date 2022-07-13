//
//  NewsConfigurator.swift
//  Presentation
//
//  Created by Jordan Capa on 12-07-22.
//

import Data
import Domain

public class NewsConfigurator {
    static func configure(_ view: NewsViewProtocol) {
        let repository = NewsRemoteRepository()
        let interactor = NewsInteractor(repository: repository)
        let presenter =  NewsPresenter(interactor: interactor, view: view)
        let router = NewsRouter()
        router.view = view
        presenter.view?.router = router
        presenter.view?.presenter = presenter
    }
}

