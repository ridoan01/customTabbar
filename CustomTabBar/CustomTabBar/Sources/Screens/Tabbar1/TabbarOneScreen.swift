	//
	//  TabbarOneScreen.swift
	//  CustomTabBar
	//
	//  Created by Ridoan Wibisono on 03/11/21.
	//

import SwiftUI

struct TabbarOneScreen: View {
	@StateObject var screenRouter: ScreenRouter = ScreenRouter()
	@State var showPopUp = false
	
	var body: some View {
		ZStack{
			VStack{
				Spacer()
				switch screenRouter.currentPage{
				case .home:
						//				Text("Home")
					HomeScreen()
				case .budget:
					Text("Budget")
				case .daily:
					Text("Daily")
				case.stats:
					Text("Stats")
				case.profile:
					ScrollView(.vertical){
						Text("Profile")
							.frame(width: UIScreen.main.bounds.width, height: 1000)
							.background(Color.green)
					}
					
				case .setting:
					Text("Setting")
				}
				Spacer()
				
			}
			HStack(alignment: .center){
				TabbarOneIcons(screenRouter: screenRouter, assignedPage: .home, defIconName: "house", tabName: "Home")
				TabbarOneIcons(screenRouter: screenRouter, assignedPage: .stats, defIconName: "chart.xyaxis.line", tabName: "Stats")
				TabbarOneIcons(screenRouter: screenRouter, assignedPage: .daily, defIconName: "calendar", tabName: "Daily")
				TabbarOneIcons(screenRouter: screenRouter, assignedPage: .setting, defIconName: "gear", tabName: "Setting")
				TabbarOneIcons(screenRouter: screenRouter, assignedPage: .profile, defIconName: "person", tabName: "Profile")
				
			}
			.padding()
			.frame(width: UIScreen.main.bounds.width-40, height: 60, alignment: .center)
			.background(Color(UIColor.secondarySystemBackground))
			.cornerRadius(8)
			.offset(x: 0, y: UIScreen.main.bounds.height/2-80)
		}
		.edgesIgnoringSafeArea(.bottom)
	}
}

struct TabbarOneScreen_Previews: PreviewProvider {
	static var previews: some View {
		TabbarOneScreen().preferredColorScheme(.light)
	}
}


struct TabbarOneIcons: View{
	@StateObject var screenRouter: ScreenRouter
	
	let assignedPage: Page
	let defIconName, tabName: String
	
	var body: some View{
		
		HStack{
			Spacer()
			VStack{
				if screenRouter.currentPage == assignedPage {
					Text(tabName)
						.font(.footnote)
						.foregroundColor(Color("orangeish"))
						.transition(AnyTransition.scale)
				}
				
				Image(systemName: screenRouter.currentPage != assignedPage ? defIconName : "minus")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: 44, maxHeight: 44, alignment: .center)
					.foregroundColor(screenRouter.currentPage == assignedPage ? Color("greenish") : Color(UIColor.label))
					.transition(AnyTransition.scale)
			}
			
			.onTapGesture {
				withAnimation{
					screenRouter.currentPage = assignedPage
					
				}
				
			}
			Spacer()
		}
		
	}
}
