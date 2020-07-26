//
//  InternetViewController.swift
//  Bottle Rocket
//
//  Created by Pavitra on 23/07/20.
//  Copyright © 2020 Mahabaleshwar. All rights reserved.
//

import UIKit
import  WebKit

class InternetViewController: UIViewController {
    
    var webView = WKWebView()
    let link = URL(string:"https://www.bottlerocketstudios.com")!
    
    //MARK:- View Life Cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        self.addConstraint()
        let request = URLRequest(url: link)
        webView.load(request)
        self.addBarButtons()
    }
}

extension InternetViewController {
    
    func addConstraint() {
        let topConstraint = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        view.addConstraints([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
    
    
    func addBarButtons() {
        let backBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(self.backButtonTapped))
        backBarButton.tintColor = .white
        let refreshBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshButtonTapped))
        let nextBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(self.forwardButtonTapped))
        self.navigationItem.leftBarButtonItems = [backBarButton, refreshBarButton, nextBarButton]
    }
}
extension InternetViewController {
    @objc func backButtonTapped() {
        if (webView.canGoBack) {
            webView.goBack()
        }
    }
    
    @objc func refreshButtonTapped() {
        webView.reload()
    }
    
    @objc func forwardButtonTapped() {
        if (webView.canGoForward) {
            webView.goForward()
        }
    }
}

