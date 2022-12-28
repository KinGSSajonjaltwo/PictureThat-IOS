//
//  ViewController.swift
//  PictureThat
//
//  Created by 이민섭 on 2022/12/28.
//

import UIKit
import WebKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    @IBOutlet weak var mainWebView: WKWebView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        self.setInitialUi()
        
    }
    
        
    
}

// MARK: - Methods
extension MainViewController{
    
    func setInitialUi(){
        
        //mainWebview set
        let urlString = "https://kingssajonjaltwo.github.io/practice_MVP/JonZalSop/"
        guard let url = URL(string: urlString) else {
            return
        }
        let urlReq = URLRequest(url: url)
        self.mainWebView.load(urlReq)
        self.mainWebView.allowsBackForwardNavigationGestures = true
        self.mainWebView.backgroundColor = UIColor.clear
        self.mainWebView.isOpaque = false
    }
    
}
