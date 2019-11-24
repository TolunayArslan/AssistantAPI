//
//  BuildingRequest.swift
//  AssistantAPI
//
//  Created by Arslan, Tolunay on 23.11.19.
//  Copyright © 2019 Arslan, Tolunay. All rights reserved.
//

import Foundation

typealias BuildingNumber = Int

struct BuildingRequest {
    
    let resourceURL: URL!
    
    init(buildingNumber: BuildingNumber?) {
        
        var resourceString = "https://parkingassistant.cfapps.eu10.hana.ondemand.com/api"
        
        if let location = buildingNumber {
            // Get Recommendation
            resourceString += "/recommendation/location/\(location)"
            
        } else { } // Just get the buildings
            resourceURL = URL(string: resourceString)
            
    }
    
    /// Get all buildings
    func buildingRequest(completion: @escaping(Result<[BuildingDetail], Error>) -> Void) {
        
    }
    
    /// Get recommendation for a location.
    func recommendationRequest(completion: @escaping(Result<[BuildingDetail], Error>) -> Void) {
        
    }
    
    
    
}
