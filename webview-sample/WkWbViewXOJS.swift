//
//  WKWbViewSimpleSwift.swift
//  webview-sample
//
//  Created by Venkatakrishnan,Poornima on 3/1/17.
//  Copyright © 2017 PayPal. All rights reserved.
//


import Foundation

import UIKit
import WebKit;

class WKWbViewXOJSSwift: UIViewController, WKNavigationDelegate {
    var webview: WKWebView!;
    var instance: PYPLCheckout!
    
    @IBOutlet weak var frame: UIWebView!
    override func loadView() {
        super.loadView()
        self.webview = WKWebView()
        webview.frame = frame.frame;
        instance = PYPLCheckout.sharedInstance() as! PYPLCheckout;
        instance.setWKWebView(webview);
        webview.navigationDelegate = self;
        view.addSubview(webview);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let url = URL (string: "https://paypalmerchant.herokuapp.com/cartv2");
        let requestObj = URLRequest(url: url!);
        webview.load(requestObj);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let request:NSURLRequest = NSURLRequest(url: navigationAction.request.url!);
        
        decisionHandler((PYPLCheckout.sharedInstance() as AnyObject).handleIfPPCheckout(request as URLRequest!) ?  .allow : .cancel);
        
    }
    
    
    
}
