//
//  DetailNewViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 12-07-22.
//

import UIKit
import WebKit

class DetailNewViewController: UIViewController {
    
    var urlString: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                webView.load(URLRequest(url: url))
            }
        }
    }

}
