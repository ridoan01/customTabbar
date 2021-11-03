//
//  ScreenRouter.swift
//  CustomTabBar
//
//  Created by Ridoan Wibisono on 03/11/21.
//

import SwiftUI

class ScreenRouter : ObservableObject{
	@Published var currentPage: Page = .home
}


enum Page {
	case home
	case stats
	case profile
	case daily
	case budget
	case setting
}

