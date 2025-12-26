/*
 TODO: Create a second screen as an extension for MainView to add and save categories
 "Add Category" button should choose from existing ones
 */

import SwiftUI

extension ContentView {
	
	@ViewBuilder
	func buildCategories() -> some View {
		
		List {
			
			Text(Category(name: "Vacation",value: "5", total: ""))
			Text(Category(name: "Personal",value: "10", total: ""))
			Text(Category(name: "Emergency",value: "20", total: ""))
		}
	}
}
