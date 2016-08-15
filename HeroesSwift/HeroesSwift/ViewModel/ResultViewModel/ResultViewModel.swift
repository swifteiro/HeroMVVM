//
//  ResultViewModel.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import UIKit

class ResultViewModel: NSObject {
    
    private var result: ResultModel?
    
    var titleText: String? {
        guard (result?.title) != nil else {
            return nil
        }
        return result?.title
    }
    
    var thumbnailDictionary: NSDictionary? {
        return result?.thumbnail
    }
    
    var pageCountInt: NSInteger? {
        return result?.pageCount
    }
    
    var issueNumberInt: NSInteger? {
        return result?.issueNumber
    }
    
    var pricesArray: NSArray? {
        return result?.prices
    }
    
    var modifiedDate: String? {
        return result?.modified
    }
    
    var textObjectsArray: NSArray? {
        return result?.textObjects
    }
    
    init(result: ResultModel) {
        
        self.result = result
    }
}
