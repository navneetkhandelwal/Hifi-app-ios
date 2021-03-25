//
//  TermsNewView.swift
//  app
//
//  Created by Arpit Lokwani on 18/08/20.
//  Copyright © 2020 KZ. All rights reserved.
//

import UIKit
import WebKit

class TermsNewView: UIViewController {
    
    @IBOutlet private var webView: WKWebView!

    //---------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {

        super.viewDidLoad()
        title = "Terms of Service"
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //---------------------------------------------------------------------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        let path = Dir.application("terms.html")
        webView.load(URLRequest(url: URL(fileURLWithPath: path)))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
