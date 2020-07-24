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
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showActivityIndicatory()
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        self.addConstraint()
        let request = URLRequest(url: link)
        webView.load(request)
        self.addBarButtons()
    }
    
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
    
    func showActivityIndicatory() {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    @objc func backButtonTapped() {
        if (webView.canGoBack) {
            self.showActivityIndicatory()
            webView.goBack()
        }
    }
    
    @objc func refreshButtonTapped() {
    self.showActivityIndicatory()
        webView.reload()
    }
    
    @objc func forwardButtonTapped() {
        if (webView.canGoForward) {
            self.showActivityIndicatory()
            webView.goForward()
        }
        
    }
}
