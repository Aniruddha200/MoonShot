//
//  SecondView.swift
//  MoonShot
//
//  Created by administrator on 26/06/2021.
//

import SwiftUI

struct SecondView: View {
	
	let mission: MissionsModel
	let decodedData: DecodedModels
	
	init(with missionData: MissionsModel, from jsonData: DecodedModels) {
		self.mission = missionData
		self.decodedData = jsonData
	}
	
	@State private var scaleAmount: CGFloat = 0
	
	var body: some View {
		
		ZStack{
			GeometryReader{geo in
				Color(.white)
					.onAppear(perform: livelyViews)
				
				VStack(spacing: 10){
					
						Image("apollo\(mission.id)")
							.resizable()
							.frame(width: 150, height: 150)
							.clipShape(Circle())
							
						
						
						Section(header: Text("Crew Members")){
							List{
								ForEach(mission.crew){ person in
									HStack{
										
											Image("\(person.name)")
												.resizable()
												.frame(width: 65, height: 40)
												.clipShape(RoundedRectangle(cornerRadius: 20))
												
											
											
											
											VStack(alignment: .leading){
												Text("\(person.name.capitalized)")
													.font(.headline)
													.fontWeight(.black)
												
												Text("\(person.role)")
													.font(.subheadline)
													.fontWeight(.medium)
													
											}
											.frame(height: 50)
											.layoutPriority(1)
											
											
											NavigationLink("", destination: ThirdView(of: person))
										
											
										
										
										
										
									}
									
									
									
								}
							}
						}
						.scaleEffect(scaleAmount)
						

					
					
						ScrollView(.vertical){
							Text(mission.description)
								.font(.title3)
								.padding()
						}
						.frame(minHeight: 310)
					
						Spacer()
					
					
				}
			}
			.navigationBarTitle("Apollo\(mission.id)", displayMode: .inline)
			
		}
		
	}
	
	func livelyViews(){
		withAnimation(.easeInOut(duration: 1.6).delay(1)){
			self.scaleAmount = 1
		}
	}
}

struct SecondView_Previews: PreviewProvider {
	
	static var previews: some View {
		let decodedData = DecodedModels()
		return SecondView(with: decodedData.missionsList[1], from: decodedData)
	}
}
