//
//  SecondViewController.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak private var backButton: UIButton!
    @IBOutlet weak var complitedImage: UIImageView!
    @IBOutlet weak var dataActivity: UIActivityIndicatorView!
    
    var openingTimes = 0
    var response: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle()
        self.getData()
        
    }
    
    func setTitle() {
        openingTimes = UserDefaultsProvider.shared.index
        self.screenTitleLabel.text = "page opened \(openingTimes) times"
        self.getData()
    }
    
    func getData() {
        self.dataActivity.startAnimating()
        ItemRepository.shared.getAPIData(id: "\(self.openingTimes)", completion: { result in
            switch result {
            case.failure(_):
                self.response = UserDefaultsProvider.shared.currentData
            case .success(let response):
                self.response = response
                self.saveResponse(response)
            }
            DispatchQueue.main.async {
                self.setText()
                self.setImage()
            }
        })
    }
    
    func setText() {
        
        guard let response = self.response else { return }
        self.userIdLabel.text = "Userid: \(response.userId)"
        self.titleLabel.text = "Title: \(response.title)"
    }
    
    func setImage() {
        guard let response = self.response else { return }
        let image = ImageRepository.shared.getImage(complited: response.completed)
        self.dataActivity.stopAnimating()
        self.dataActivity.isHidden = true
        self.complitedImage.image = image
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func saveResponse(_ response: Item) {
        UserDefaultsProvider.shared.currentData = response
        
    }
    
    func saveImage(image: UIImage?) {
        guard let image = image else { return }
        ImageRepository.shared.saveImage(image: image)
    }

}
