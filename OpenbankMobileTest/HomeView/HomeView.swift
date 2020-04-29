//
//  HomeView.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class HomeView: UIViewController {

    @IBOutlet var listCollectionView: UICollectionView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var characters = [CharacterM]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    // view output methods
    
    func updateCharacters(_ characters: [CharacterM]) {
        self.characters = characters
        listCollectionView.reloadData()
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
    
    func showError(_ error: String?) {
        let alertController = UIAlertController(title: "Ups.",
                                                message: "An error has occurred",
                                                preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: "Try again later",
                                         style: .default,
                                         handler: { (alert) in
                                            self.presenter?.viewDidLoad()
                                         })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default,
                                         handler: nil)
        
        alertController.addAction(acceptAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
        
        if let cell = cell as? HomeCollectionViewCell {
            let character = characters[indexPath.row]
            
            cell.imageView.sd_setImage(with: URL(string: character.thumbnail),
                                       completed: nil)
            
            cell.nameLabel.text = character.name
        }
        
        return cell
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        
        presenter?.showDetail(character)
    }
}
