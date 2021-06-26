//
//  Codable-JsonModels.swift
//  MoonShot
//
//  Created by administrator on 23/06/2021.
//

import Foundation

struct AstronautsModel: Codable, Identifiable{
	
	let id: String
	let name: String
	let description: String

}


struct MissionsModel: Codable, Identifiable {
	
	let id: Int
	let launchDate: String?
	let crew: [Crew]
	let description: String
	
	var formattedLaunchDate: String {
		if let realDate = launchDate{
			
			
			let formatter = DateFormatter()
			
			formatter.dateFormat = "y-MM-dd"
			
			let converted = formatter.date(from: realDate) ?? Date()
			
			formatter.dateStyle = .medium
			
			return formatter.string(from: converted)
		}
		return "N/A"
	}
	
	
	
	
	struct Crew: Codable, Identifiable{
		var id: UUID{
			return UUID()
		}
		let name: String
		let role: String
	}
}


class DecodedModels {
	
	let astronautsData: [AstronautsModel] = Bundle.main.decode(from: "astronauts.json")
	
	let missionsList: [MissionsModel] = Bundle.main.decode(from: "missions.json")
}
