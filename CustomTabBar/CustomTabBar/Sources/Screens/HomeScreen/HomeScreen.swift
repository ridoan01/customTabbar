//
//  HomeScreen.swift
//  CustomTabBar
//
//  Created by Ridoan Wibisono on 04/11/21.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: false){
			VStack{
				Text("Hello, World!")
				Spacer()
				Text("Hello, Worlds")
			}
			.frame(width: 200, height: 1200, alignment: .center)
			.background(Color.red)
		}
		.background(Color.blue)
        
	}
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
