//
//  Building.swift
//  AssistantAPI
//
//  Created by Arslan, Tolunay on 23.11.19.
//  Copyright © 2019 Arslan, Tolunay. All rights reserved.
//

import Foundation

struct BuildingResponse: Decodable {
    var reponse: [BuildingDetail]
}
typealias gitString = String
struct BuildingDetail: Decodable {
    var id: Int
    var name: gitString
    var adress: String
    var OK = 99
    
}
