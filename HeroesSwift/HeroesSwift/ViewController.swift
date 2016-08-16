//
//  ViewController.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate  {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrayMagazines = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadMagazines()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: LoadMagazines
    func loadMagazines() {
        
        MagazineController.getMagazines({ (responseArray) in
            
            if let arrayObj :NSMutableArray = responseArray {
                
                self.arrayMagazines = arrayObj
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.collectionView.reloadData()
                })
            }
            
        }) { (errorString) in
            
            print(errorString)
        }
    }
    
    
    // MARK: UICollectionViewDelegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMagazines.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        
        let cellIdentifier = "MagazineCell"
        let cell :MagazineCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath:indexPath) as! MagazineCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        let magazineCell: MagazineCell = cell as! MagazineCell
        
        let magazine = self.arrayMagazines[indexPath.row]
        let cellViewModel = MagazineCellViewModel(magazine: magazine as! MagazineModel)
        magazineCell.setupCell(cellViewModel)
    }
}

