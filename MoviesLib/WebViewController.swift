//
//  WebViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/09/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading.startAnimating()
        webView.delegate = self
        
        let webURL = URL(string: url)!
        let request = URLRequest(url: webURL)
        webView.loadRequest(request)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func runJS(_ sender: Any) {
       webView.stringByEvaluatingJavaScript(from: "alert('Hello World!')")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WebViewController: UIWebViewDelegate{
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loading.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url!.absoluteString)
        
        let absoluteString = request.url!.absoluteString
        
        if absoluteString.range(of: "facebook") != nil {
            
            let alert = UIAlertController(title: "Erro", message: "Facebook proibido nesse App", preferredStyle: .actionSheet)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                print("OK")
            })
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: (nil))
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            present (alert, animated: true, completion: nil)
            
            return false
        }
        return true;
    }
}
