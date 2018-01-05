//
//  CarsCollectionViewController.swift
//  output11
//
//  Created by Ace on 06/12/2017.
//  Copyright © 2017 Ace. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CarCell"

class CarsCollectionViewController: UICollectionViewController {
    
    let carImages = [#imageLiteral(resourceName: "BMW"), #imageLiteral(resourceName: "Benz"), #imageLiteral(resourceName: "Probox"), #imageLiteral(resourceName: "withering rose"), #imageLiteral(resourceName: "Volvo")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return carImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CarsCollectionViewCell else { return UICollectionViewCell()}
        cell.myImage.image = carImages[indexPath.row]
        
        // Configure the cell
    
        return cell
    }


}
