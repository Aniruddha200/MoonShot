//
//  ThirdView.swift
//  MoonShot
//
//  Created by administrator on 26/06/2021.
//

import SwiftUI

struct ThirdView: View {
	
	let person: MissionsModel.Crew
	init(of entity: MissionsModel.Crew) {
		self.person = entity
	}
	let decodedData = DecodedModels().astronautsData
	var personInfo: AstronautsModel?{
		return decodedData.first(where: {$0.id == self.person.name})
		
	}
	
    var body: some View {
		VStack{
			Image(person.name)
				.resizable()
				.frame(width: 300, height: 300)
				.clipShape(RoundedRectangle(cornerRadius: 30))
			
			Group{
				Text("\(personInfo?.name ?? "N/A")")
					.font(.title)
					.fontWeight(.black)
				
				Text("\(person.role)")
					.font(.title3)
					.fontWeight(.black)
				
				ScrollView(.vertical){
					Text("\(personInfo?.description ?? "N/A")")
				}
			}
			.padding()
		}
		.navigationBarTitle("Austronaut", displayMode: .inline)
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
		ThirdView(of: DecodedModels().missionsList[0].crew[0])
    }
}
