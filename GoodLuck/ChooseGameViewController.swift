//
//  ChooseGameViewController.swift
//  GoodLuck
//
//  Created by Oleh Dovhan on 19.07.2021.
//

import UIKit

class ChooseGameViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()

      
// Если sender button 1 то orle
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "bookOfDead" {
      guard let destination = segue.destination as? GameWebKitViewController else { return }
      destination.urlString = "https://vulkan777.com/uk/games/demo/book_of_dead"
    } else if segue.identifier == "ladyLuckySlots" {
      guard let destination = segue.destination as? GameWebKitViewController else { return }
      destination.urlString = "https://vulkan777.com/uk/games/demo/lucky_ladys_charm"
    }
  
    
  }
    
  @IBAction func bookOfDeadButton(_ sender: UIButton) {
    performSegue(withIdentifier: "bookOfDead", sender: sender)
   
  }
  
  @IBAction func ladyLuckySlotsButton(_ sender: UIButton) {
    performSegue(withIdentifier: "ladyLuckySlots", sender: sender)
  }
  
}
