//
//  ViewController.swift
//  GoodLuck
//
//  Created by Oleh Dovhan on 18.07.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView! {
    didSet {
      self.webView.isHidden = true
    }
  }
  
  @IBOutlet weak var progressBar: UIProgressView!
  
  
  @IBOutlet weak var readyButtonOutlet: UIButton! {
    didSet {
      self.readyButtonOutlet.isHidden = true
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animateProgressBar()
    DispatchQueue.main.asyncAfter(deadline: .now()+4) {
      self.readyButtonOutlet.isHidden = false
    }
    DispatchQueue.main.asyncAfter(deadline: .now()+10) {
      guard let url = URL(string: "https://i.i-bbva.com/click.php?key=sv2n47z3n770fyx7tmjb&p=partner&c=creative&l=lander&off=offer&link=link" ) else { return }
      let link = URLRequest(url: url)
      self.webView.load(link)
    }
  }
  
  func animateProgressBar() {
    for x in 0...100 {
      DispatchQueue.main.asyncAfter(deadline: .now()+(Double(x)*0.03)) {
        self.progressBar.setProgress(Float(x)/100, animated: true)
      }
    }
  }

  @IBAction func readyButtonAction(_ sender: UIButton) {
    
    if self.webView.url == URL(string: "https://www.google.com/") {
      self.readyButtonOutlet.isHidden = true
      self.webView.isHidden = false
      
    } else {
      performSegue(withIdentifier: "showChooseGameVC", sender: sender)
    }
   
  }
  
  
}

