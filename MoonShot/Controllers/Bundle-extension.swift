//
//  Bundle-extension.swift
//  MoonShot
//
//  Created by administrator on 23/06/2021.
//

import Foundation


extension Bundle{
	func decode<T: Codable>(from sourceName: String) -> T {
		
		guard let url = url(forResource: sourceName, withExtension: nil) else {
			fatalError("Not a valid url")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("No data found from url")
		}
		
		let decoder = JSONDecoder()
		
		
		guard let decodedData = try? decoder.decode(T.self, from: data) else {
				fatalError("Couldn't decoded the data")
		}
		
		return decodedData
	}
}
