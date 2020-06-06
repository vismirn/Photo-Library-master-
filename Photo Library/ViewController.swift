//
//  ViewController.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 30.05.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var age: Int
}

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let users = [User(name: "Alexey", age: 13), User(name: "Bob", age: 13)]
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationController()
        
        networkService.request(searchText: "RainBow") { (myData, myError) in
            print(myData)
        }
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            
//            layout.itemSize = CGSize(width: 100, height: 100)
//
//            layout.minimumLineSpacing = 20
//            layout.minimumInteritemSpacing = 50
        }
        
    }
    
    //приставка objc ставиться только если функция идёт в #selector (метод, выше)
    @objc func addButtonPressed() {
        
    }
    
    @objc func sharedButtonPressed() {
        
    }
    
    func setupNavigationController() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        let sharedButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedButtonPressed))
        navigationItem.rightBarButtonItems = [sharedButton, addButton]
        
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .darkGray
        let photoTitle = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.leftBarButtonItem = photoTitle
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        
        let array = [1,4,5,7,9,0]
        
//        let number = array[indexPath.item]
    
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        return CGSize(width: collectionView.frame.width, height: 44)

        return CGSize(width: 100, height: 100)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 60
    }
    
    
}



