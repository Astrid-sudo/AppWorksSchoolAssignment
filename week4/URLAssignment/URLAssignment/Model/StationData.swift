//
//  StationData.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/19.
//

import Foundation

struct StationData: Codable {
    
    let stationID: String
    let stationName: String
    let stationAddress: String
}

struct StationDataAddress {
    
    static let r3 = "https://stations-98a59.firebaseio.com/practice.json"

}
