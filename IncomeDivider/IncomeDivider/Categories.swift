/*
 TODO: Create a second screen as an extension for MainView to add and save categories
 "Add Category" button should choose from existing ones
 */

import SwiftUI

extension ContentView {
	
	@ViewBuilder
	func buildCategories() -> some View {
		
		// May be add TabBar?
		
		List {
			HStack {
				Text("Vacation")
				Text("Personal")
				Text("20")
			}
		}
		Button("Add Category") {
			// Category
		}
		Button("Delete Category") {
			// Delete last category
		}
		Button("Done") {
			// Save changes and move back to main screen
		}
	}
}
