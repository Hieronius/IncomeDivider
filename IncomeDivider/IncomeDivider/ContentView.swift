import SwiftUI

/// The entity to describe a typical money spending category
struct Category: Identifiable {
	
	let id = UUID()
	var name = ""
	var value = ""
	var total = ""
}

struct ContentView: View {
	
	@State var income = ""
	@State var categories = [Category()]
	@State var percentsLeft = ""
	@State var moneyLeft = ""
	@State var didCalculateResult = false
	
    var body: some View {
        
		List {
			
			Section(header: Text("Income")) {
				TextField("Income", text: $income)
			}
			
			Section(header: Text("Categories")) {
				
				ForEach($categories) { $category in
					
					// this block should be implemented as a single view to add
					HStack {
						TextField("Name", text: $category.name)
						TextField("Value in %", text: $category.value)
						Text("Total: \(category.total)")
					}
				}
			}
			
				Button("Add Category") {
					addCategory()
				}
				Button("Remove Category") {
					removeCategory()
				}
			
			if didCalculateResult {
				Section(header: Text("Results")) {
					Text("Money left: \(moneyLeft)")
					Text("% of summ left: \(percentsLeft)")
				}
			}
		}
		.background(.white)

		Button("Divide") {
			divideIncome()
		}
		.frame(width: 200, height: 50)
		.background(.gray)
		.foregroundStyle(.white)
		.clipShape(.capsule)
		
    }
}

// MARK: Logic

extension ContentView {
	
	func divideIncome() {
		
		var totalMoney = Double(income) ?? 0
		var totalPercentage = 100
		
		let onePercentIncome = Int(totalMoney / 100)
		for index in categories.indices {
			let category = categories[index]
			let total = (Double(category.value) ?? 0) * Double(onePercentIncome)
			categories[index].total = String(total)
			
			totalMoney -= total
			totalPercentage -= Int(category.value) ?? 0
		}
		moneyLeft = String(totalMoney)
		percentsLeft = String(totalPercentage)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
			self.didCalculateResult = true
		}
	}
	
	func addCategory() {
		categories.append(Category())
	}
	
	func removeCategory() {
		
		guard !categories.isEmpty else { return }
		
		let amount = categories.count
		categories.remove(at: amount-1)
	}
}

#Preview {
    ContentView()
}
