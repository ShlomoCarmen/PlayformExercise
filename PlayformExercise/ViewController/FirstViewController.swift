//
//  ViewController.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak private var startButton: UIButton!
    @IBOutlet weak var startButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var startButtonWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        self.setSize()
    }

    func setSize() {
        let screenSize: CGRect = UIScreen.main.bounds
        startButtonHeightConstraint?.constant = screenSize.height / 2
        startButtonWidthConstraint?.constant = screenSize.width / 2
        
        self.startButton.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        self.startButton.layer.borderWidth = 1.0
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        UserDefaultsProvider.shared.index += 1
        self.performSegue(withIdentifier: "presentSecond", sender: self)
    }
    

}



