import SwiftUI

struct ContentView: View {
	
	@State var incomeValue = ""
	@State var categoryName = ""
	@State var categoryValue = ""
	
    var body: some View {
        
		List {
			
			Section(header: Text("Income")) {
				TextField("Income", text: $incomeValue)
			}
			
			Section(header: Text("Categories")) {
				
				// this block should be implemented as a single view to add
				HStack {
					TextField("Name", text: $categoryName)
					TextField("Value in %", text: $categoryValue)
					Text("Total: ")
				}
				Button("Add Category") {
					print("added category")
				}
			}
		}
		.background(.white)

		Button("Divide") {
			print("divided")
		}
		.frame(width: 200, height: 50)
		.background(.gray)
		.foregroundStyle(.white)
		.clipShape(.capsule)
		
    }
}

#Preview {
    ContentView()
}
