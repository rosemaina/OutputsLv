//
//  CarViewController.swift
//  output11
//
//  Created by Ace on 27/11/2017.
//  Copyright © 2017 Ace. All rights reserved.
//

import UIKit

class CarViewController: UICollectionView {
    
    let images = [#imageLiteral(resourceName: "BMW"),#imageLiteral(resourceName: "Lamborghini"),#imageLiteral(resourceName: "Benz"),#imageLiteral(resourceName: "Probox"),#imageLiteral(resourceName: "withering rose")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carCell2", for: indexPath) as! CarsCollectionViewCell
        
        cell.myImage.image = images[indexPath.row]
        
        return cell
        
    }
    

}
