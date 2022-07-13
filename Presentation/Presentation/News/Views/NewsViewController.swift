//
//  NewsViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 12-07-22.
//

import UIKit
import Domain

protocol NewsViewProtocol: AnyObject {
    var presenter: NewsPresenterPortocol? { get set }
    var router: NewsRouterProtocol? { get set }
    func showNews(news: [NewsViewModel])
}

class NewsViewController: UIViewController  {
    
    private var newsLista: [NewsViewModel] = []
    var presenter: NewsPresenterPortocol?
    var router: NewsRouterProtocol?
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        NewsConfigurator.configure(self)
        if let presenter = presenter {
            presenter.fetchNews()
        }
    }
    
    private func prepareTableView() {
        title = "Noticias"
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsLista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as? NewTableViewCell else {
            return UITableViewCell()
        }
        cell.dateLabel.text = newsLista[indexPath.row].date
        cell.descriptionLabel.text = newsLista[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = newsLista[indexPath.row]
        router?.goToDetailView(new: new)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _,completionHandler) in
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
}

extension NewsViewController: NewsViewProtocol {
    func showNews(news: [NewsViewModel]) {
        newsLista = news
        newsTableView.reloadData()
    }
}
