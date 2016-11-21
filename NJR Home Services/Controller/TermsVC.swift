//
//  TermsVC.swift
//  NJR Home Services
//
//  Created by Bogdan on 11/21/16.
//  Copyright © 2016 Bogdan. All rights reserved.
//

import UIKit

class TermsVC: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self

        SVProgressHUD.show()
        
        let url = URL(string: "http://www.njrhomeservices.com/solar/Solar_Referral_Program_2_2016.pdf")!
        webView.loadRequest(URLRequest(url: url))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    //MARK: - WebView Delegate Methods...
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        NSLog("did start load")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        NSLog("did finish load")
        
        SVProgressHUD.dismiss()
    }
}
