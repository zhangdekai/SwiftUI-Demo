//
//  ModelData.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/10.
//

import Foundation


class ModelData: ObservableObject {
    
    var landmarks:[LandMark] = loadJsonFile("landmarkData.json")
    
    var hikes: [Hike] = loadJsonFile("hikeData.json")
    
    var categories: [String: [LandMark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [LandMark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var profile = Profile.default
    
}

var landMarkData:[LandMark] = loadJsonFile("landmarkData.json")

func loadJsonFile<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
