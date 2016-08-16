//
//  MagazineModel.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import UIKit

class MagazineModel: NSObject {
    
    var title: String?
    var thumbnail: NSDictionary?
    var pageCount: NSInteger?
    var issueNumber: NSInteger?
    var prices: NSArray?
    var modified: String?
    var textObjects: NSArray?
    
    init(title: String?, thumbnail: NSDictionary?, pageCount: NSInteger?, issueNumber: NSInteger?, prices: NSArray?, modified: String?, textObjects: NSArray?) {
        
        self.title = title
        self.thumbnail = thumbnail
        self.pageCount = pageCount
        self.issueNumber = issueNumber
        self.prices = prices
        self.modified = modified
        self.textObjects = textObjects
    }
}
