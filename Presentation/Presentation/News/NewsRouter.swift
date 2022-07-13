//
//  NewsRouter.swift
//  Presentation
//
//  Created by Jordan Capa on 12-07-22.
//

import UIKit
import Domain
 
protocol NewsRouterProtocol {
    var view: NewsViewProtocol? { get set }
    func goToDetailView(new: NewsViewModel)
}
 
class NewsRouter: NewsRouterProtocol {
    var view: NewsViewProtocol?
    func goToDetailView(new: NewsViewModel) {
        if let view = view as? UIViewController {
            let viewViewController = DetailNewViewController()
            viewViewController.urlString = new.storyUrl
            view.navigationController?.pushViewController(viewViewController, animated: true)
        }
    }
}
