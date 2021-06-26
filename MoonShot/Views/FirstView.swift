//
//  ContentView.swift
//  MoonShot
//
//  Created by administrator on 21/06/2021.
//

import SwiftUI

struct FirstView: View {
	
	
	let decodedData = DecodedModels()
		
	var body: some View {
		
		NavigationView{
			
			GeometryReader{ geo in
				List(decodedData.missionsList){ mission in
					
					HStack(spacing: 20){
						
						
						Image("apollo\(mission.id)")
							.resizable()
							.frame(maxWidth: 70, maxHeight: 70)
							.clipShape(Circle())
						
						VStack(alignment: .leading, spacing: 5){
							Text("Apollo\(mission.id)")
								.font(.headline)
								.fontWeight(.black)
							
							Text("\(mission.formattedLaunchDate)")
								.font(.body)
								.foregroundColor(.secondary)
							
						}
						NavigationLink("", destination: SecondView(with: mission, from: decodedData))
						
					}
					
					
				}
				.frame(minWidth: geo.size.width, maxHeight: geo.size.height * 0.99)
			}
			
			.navigationBarTitle("Moon Shot", displayMode: .inline)
			.navigationViewStyle(StackNavigationViewStyle())
		}
		
	}
	
}

struct FirstView_Previews: PreviewProvider {
	static var previews: some View {
		FirstView()
	}
}
