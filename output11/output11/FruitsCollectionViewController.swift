//
//  FruitsCollectionViewController.swift
//  output11
//
//  Created by Ace on 24/11/2017.
//  Copyright © 2017 Ace. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FruitCell"

class FruitsCollectionViewController: UICollectionViewController {
    
    var fruitImages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        fruitImages = ["Apple",
                       "Apricot",
                       "Banana",
                       "Blueberry",
                       "Cantaloupe"]
        
//        let itemSize = UIScreen.main.bounds.width
//        
//        let layout = UICollectionViewFlowLayout()
//         layout.itemSize = CGSize(width:itemSize, height: itemSize)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return fruitImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCell", for: indexPath) as? FruitCollectionViewCell else { return UICollectionViewCell()}
        
        // Configure the cell
        let image = UIImage(named: fruitImages[indexPath.row])
//        cell.contentView.addSubview(UIImageView(image: image))
        //cell.frame.size = CGSize(width: 500, height: 500)
        cell.imageView.image = image
    
        return cell
    }
}

