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
    
    
    // MARK: GET
    class func getMagazines(successBlock : (NSMutableArray? -> ()),
                    failure failureBlock : (String! -> ())) {
        
        let urlString: String = (APIRequest.serverAPI) + (APIRequest.pathAPI)
        let parameters: NSDictionary = ["ts" : APIRequest.tsAPI, "apikey" : APIRequest.apikey, "hash" : APIRequest.hashNumer]
        
        Alamofire.request(.GET, urlString, parameters:parameters as? [String : AnyObject])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    
                    print("Validation Successful")
                    
                    if let dictResponse = response.result.value?.objectForKey("data") as? NSDictionary {
                        if let arrayObj = dictResponse.objectForKey("results") as? NSArray {
                            
                            successBlock(MagazineController.startParsing(arrayObj))
                        }
                    }
                    
                case .Failure(let error):
                    
                    failureBlock("não vai dar não")
                    print(error)
                }
        }
    }
    
    
    //MARK: FromJSONFile
    class func jsonParsingFromFile(withString: String?) -> NSMutableArray
    {
        let path :NSString = (NSBundle.mainBundle().pathForResource("MagazineMock", ofType: "json") ?? "")
        var data :NSData?
        
        if path != "" {
            do {
                data = try NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped)
            } catch {
                data = nil
            }
            
            if let dataJson = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(dataJson, options: .AllowFragments)
                    if let dictData = json.objectForKey("data") as? NSDictionary {
                        if let arrayObj = dictData.objectForKey("results") as? NSArray {
                            return MagazineController.startParsing(arrayObj)
                        }
                    }
                } catch {
                    print("error serializing JSON: \(error)")
                }
            }
        }
        
        return NSMutableArray()
    }
    
    
    //MARK: ObjParsing
    class func startParsing(data: NSArray?) -> NSMutableArray
    {
        let arrayMagazine = NSMutableArray()
        
        if let objData = data {
            
            if objData.count > 0 {
                
                for obj in objData {
                    
                    let magazine = MagazineModel(title: (obj.objectForKey("title") ?? "") as? String,
                                                 thumbnail: obj.objectForKey("thumbnail" ?? "") as? NSDictionary,
                                                 pageCount: obj.objectForKey("pageCount" ?? "") as? NSInteger,
                                                 issueNumber: obj.objectForKey("issueNumber" ?? "") as? NSInteger,
                                                 prices: obj.objectForKey("prices" ?? "") as? NSArray,
                                                 modified: obj.objectForKey("modified" ?? "") as? String,
                                                 textObjects: obj.objectForKey("textObjects" ?? "") as? NSArray)
                    
                    arrayMagazine.addObject(magazine)
                }
            }
        }
        
        return arrayMagazine
    }
}
