//
//  APIManager.swift
//  SPS
//
//  Created by Mohammed hassan on 11/14/20.
//  Copyright © 2020 Mohammed hassan. All rights reserved.
//

import SwiftyJSON

class APIManager: NSObject, OperationalRepository {
    internal func GetCountriesList(completionHandler: @escaping (_ result:[CountriesResponseModel]?, _ statusCode : Int, _ error_Response_Model:Error_Response_Model?) -> Void) {
        let Newurl = BaseApi.mainPath
        excuteServerOperation(url: Newurl, way: .get, completionHandler: { (result, statusCode, errorModel ) in
            do{
                let jsonDecoder = JSONDecoder()
                var responseModel : [CountriesResponseModel]!
                var errorModel : Error_Response_Model!
                if(statusCode == 200){
                    responseModel = try jsonDecoder.decode([CountriesResponseModel].self, from: result as! Data)
                    errorModel = nil
                } else {
                    responseModel = nil
                    errorModel = Error_Response_Model.init()
                }
                completionHandler(responseModel, statusCode, errorModel)
            }
            catch{}
        } )
    }
}
