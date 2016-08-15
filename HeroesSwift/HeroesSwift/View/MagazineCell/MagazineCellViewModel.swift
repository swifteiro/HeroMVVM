//
//  MagazineCellViewModel.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import UIKit

class MagazineCellViewModel: NSObject, CellPresentation {

    private var result: ResultModel?
    
    var titleText: String? {
        guard (result?.title) != nil else {
            return nil
        }
        return result?.title
    }
    
    init(magazine: ResultModel) {
        
        self.result = magazine
    }
    
    
    func changeTitle(cell: MagazineCell) {
        
        cell.titleLabel.text = self.result?.title
    }
}
