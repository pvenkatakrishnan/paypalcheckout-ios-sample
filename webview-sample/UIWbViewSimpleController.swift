//
//  UIWbViewSimpleController.swift
//  webview-sample
//
//  Created by Venkatakrishnan,Poornima on 3/1/17.
//  Copyright © 2017 PayPal. All rights reserved.
//

import Foundation

import UIKit

class WebViewControllerSwift: UIViewController, UIWebViewDelegate {
    @IBOutlet var instance: PYPLCheckout!
    
    @IBOutlet weak var ppwbeview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad();
        
        instance = PYPLCheckout.sharedInstance() as! PYPLCheckout;
        let url = URL (string: "https://paypalmerchant.herokuapp.com/cart");
        let requestObj = URLRequest(url: url!);
        ppwbeview.delegate = self;
        instance.setWebView(ppwbeview);
        ppwbeview.loadRequest(requestObj);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return instance.handleIfPPCheckout(request as URLRequest!);
    }
    
}
