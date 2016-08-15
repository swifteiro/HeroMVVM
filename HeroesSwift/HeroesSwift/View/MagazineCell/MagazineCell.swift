//
//  MagazineCell.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import UIKit

class MagazineCell: UICollectionViewCell {
    
    typealias CellProtocol = protocol <CellPresentation>

    @IBOutlet weak var titleLabel: UILabel!
    
    func setupCell(cellProtocol: CellProtocol) {
        
        cellProtocol.changeTitle(self)
    }
}
