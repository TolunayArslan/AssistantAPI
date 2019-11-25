//
//  BuildingRequest.swift
//  AssistantAPI
//
//  Created by Arslan, Tolunay on 23.11.19.
//  Copyright © 2019 Arslan, Tolunay. All rights reserved.
//

import Foundation

typealias BuildingNumber = Int

enum ParkingError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct BuildingRequest {
    
    let resourceURL: URL!
    
    init(buildingNumber: BuildingNumber?) {
        
        var resourceString = "https://parkingassistant.cfapps.eu10.hana.ondemand.com/api"
        
        if buildingNumber != nil {
            // Get Recommendation
            resourceString += "/recommendation/location/\(buildingNumber!)"
            
        } else { } // Just get all buildings
            resourceURL = URL(string: resourceString + "/location")
    }
    
    /// Get all buildings
    func buildingRequest(completion: @escaping(Result<[BuildingDetail], ParkingError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                print("No data available!")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let buildingReponse = try jsonDecoder.decode(BuildingResponse.self, from: jsonData)
                
                let buildings = buildingReponse.reponse
                completion(.success(buildings))
                
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
        
    }
    
    /// Get recommendation for a location.
    func recommendationRequest(completion: @escaping(Result<[RecommendationDetail], ParkingError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                print("no data available")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let recommendationReponse = try jsonDecoder.decode(RecommendationResponse.self, from: jsonData)
                
                let recommendationDetails = recommendationReponse.recommendedAreas
                completion(.success(recommendationDetails))
                
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()

    }
    
    
    
}
