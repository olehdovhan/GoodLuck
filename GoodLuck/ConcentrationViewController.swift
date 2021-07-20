//
//  ConcentrationViewController.swift
//  GoodLuck
//
//  Created by Oleh Dovhan on 20.07.2021.
//

import UIKit

class ConcentrationViewController: UIViewController {

  lazy var game = Concentration(numberOfPairsOfCards:(cardButtons.count + 1) / 2)
  
  
  @IBOutlet var cardButtons: [UIButton]!
  var flipCount: Int = 0 {
    didSet {
      flipCountLabel.text = "Flips: \(flipCount)"
    }
  }
  
  @IBOutlet weak var flipCountLabel: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func touchCard(_ sender: UIButton) {
    flipCount += 1
    if let cardNumber = cardButtons.firstIndex(of: sender) {
      game.chooseCard(at: cardNumber)
      updateViewFromModel()
    } else {
      print(" chosen card was not in cardButtons")
    }
  }
  
  @IBAction func AgainButton(_ sender: UIButton) {
    
    flipCount = 0
       game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
       updateViewFromModel()
  }
  
  
  @IBAction func cancelAction(_ sender: UIButton) {
    dismiss(animated: true) {
      
    }
  }
  
  
  func updateViewFromModel() {
    for index in cardButtons.indices {
      let button = cardButtons[index]
      let card = game.cards[index]
      if card.isFaceUp {
        button.setTitle(emoji(for: card), for: UIControl.State.normal)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      } else {
        button.setTitle("", for: UIControl.State.normal)
        button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
      }
    }
  }
  
  var emojiChoices = ["🏀", "⚽️","💻", "🏉", "🥰", "🐁", "🥎","❤️"]
  
  var emoji = [Int:String]()
  
  func emoji(for card: Card) -> String {
    if emoji[card.identifier] == nil, emojiChoices.count > 0 {
      let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
      emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
  }
    return emoji[card.identifier] ?? "?"
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
