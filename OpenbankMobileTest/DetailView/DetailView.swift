//
//  DetailView.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 29/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        descriptionLabel.text = ""
        
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    // view output methods
    func showDetailCharacter(_ character: CharacterM) {
        imageView.sd_setImage(with: URL(string: character.thumbnail),
                              completed: nil)
        
        titleLabel.text = character.name
        descriptionLabel.text = character.description
    }
    
    func loadActivity() {
        DispatchQueue.main.async {
            self.activityIndicatorView.startAnimating()
        }
    }
    
    func stopActivity() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
        }
    }
}
