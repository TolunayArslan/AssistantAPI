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

struct BuildingDetail: Decodable {
    var id: Int
    var name: String
    var adress: String
}

//

struct RecommendationResponse: Decodable {
    //var response: String
    var recommendedAreas: [RecommendationDetail]
}

struct RecommendationDetail: Decodable {
    var name: String
    var available: Int
    var occupiedPercent: Double
}
