//
//  ResultViewModel.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import UIKit

class ResultViewModel: NSObject {
    
    private var magazine: MagazineModel?
    
    var titleText: String? {
        guard (magazine?.title) != nil else {
            return nil
        }
        return magazine?.title
    }
    
    var thumbnailDictionary: NSDictionary? {
        return magazine?.thumbnail
    }
    
    var pageCountInt: NSInteger? {
        return magazine?.pageCount
    }
    
    var issueNumberInt: NSInteger? {
        return magazine?.issueNumber
    }
    
    var pricesArray: NSArray? {
        return magazine?.prices
    }
    
    var modifiedDate: String? {
        return magazine?.modified
    }
    
    var textObjectsArray: NSArray? {
        return magazine?.textObjects
    }
    
    init(result: MagazineModel) {
        
        self.magazine = result
    }
}
