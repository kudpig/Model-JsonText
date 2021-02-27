//
//  BeforeViewController.swift
//  Model-JsonText
//
//  Created by Shinichiro Kudo on 2021/02/27.
//

import UIKit

class BeforeViewController: UIViewController {
    
    @IBOutlet weak var firstItemLabel: UILabel!
    
    @IBOutlet weak var secondItemLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    @IBOutlet weak var firstButton: UIButton! {
        didSet {
            firstButton.layer.cornerRadius = 40
        }
    }
    
    @IBOutlet weak var secondButton: UIButton! {
        didSet {
            secondButton.layer.cornerRadius = 40
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapFirstButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goItemList", sender: nil)
    }
    
    @IBAction func tapSecondButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goItemList", sender: nil)
    }
    

}
