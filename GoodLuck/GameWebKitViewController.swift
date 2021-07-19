//
//  GameWebKitViewController.swift
//  GoodLuck
//
//  Created by Oleh Dovhan on 19.07.2021.
//

import UIKit
import WebKit

class GameWebKitViewController: UIViewController {

  
  var urlString = ""
  
  
  @IBOutlet weak var gameWebView: WKWebView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      guard let url = URL(string: urlString  ) else { return }
      let link = URLRequest(url: url)
      self.gameWebView.load(link)
      }
        // Do any additional setup after loading the view.
    
    
  @IBAction func cancelButton(_ sender: Any) {
    dismiss(animated: true) {
    }
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
