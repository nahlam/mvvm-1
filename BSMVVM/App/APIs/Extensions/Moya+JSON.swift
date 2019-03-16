//
//  Moya+JSON.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation

// to make a good formating of the JSON returned
func moyaJSONResponseDataFormatter(data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: JSONSerialization.WritingOptions.prettyPrinted)
        return prettyData
        
    } catch {
        return data
    }
}
