//
//  MagazineController.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import UIKit

import Alamofire

class MagazineController: NSObject {
    
    func getMagazines(successBlock : (NSMutableArray? -> ())!,
                      failure failureBlock : (String! -> ())!) {
        
        let urlString: String = (APIRequest.serverAPI) + (APIRequest.pathAPI)
        let parameters: NSDictionary = ["ts" : APIRequest.tsAPI, "apikey" : APIRequest.apikey, "hash" : APIRequest.hashNumer]
        
        Alamofire.request(.GET, urlString, parameters:parameters as? [String : AnyObject])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    
                    print("Validation Successful")
                    let array = self.startParsing((response.result.value?.objectForKey("data")! as! NSDictionary).objectForKey("results")! as! NSArray)
                    successBlock(array)
                    
                case .Failure(let error):
                    
                    failureBlock("não vai dar não")
                    print(error)
                }
        }
    }
    
    func jsonParsingFromFile(withString: String?) -> NSMutableArray
    {
        let path: NSString = NSBundle.mainBundle().pathForResource("MagazineMock", ofType: "json")!
        let data: NSData = try! NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped)
        let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
        
        return self.startParsing((dict.objectForKey("data")! as! NSDictionary).objectForKey("results")! as! NSArray)
    }
    
    func startParsing(data: NSArray) -> NSMutableArray
    {
        let arrayMagazine = NSMutableArray()
        
        for obj in data {
            
            let magazine = ResultModel(title: obj.objectForKey("title") as! String,
                                       thumbnail: obj.objectForKey("thumbnail") as! NSDictionary,
                                       pageCount: obj.objectForKey("pageCount") as! NSInteger,
                                       issueNumber: obj.objectForKey("issueNumber") as! NSInteger,
                                       prices: obj.objectForKey("prices") as! NSArray,
                                       modified: obj.objectForKey("modified") as! String,
                                       textObjects: obj.objectForKey("textObjects") as! NSArray)
            
            arrayMagazine.addObject(magazine)
        }
        
        return arrayMagazine
    }
}
