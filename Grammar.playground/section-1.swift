
import Foundation


extension String {
	
	func plural() -> String {
		return self + "lar"
	}

	// MARK: Noun cases
	
	func locativeCase() -> String {
		return self + "da"
	}
	
	func ablativeCase() -> String {
		return self + "dan"
	}
	
	func accusativeCase() -> String {
		
		if last(self) == "n"
		{
			return self + "i"
		} else
		{
			return self + "ni"
		}
	}
	
	func genitiveCase() -> String {
		return self + "ning"
	}
	
	func dativeCase() -> String {
		
		if last(self) == "k" {
			return self + "ka"

		}
		if last(self) == "q" {
			return self + "qa"
		}
		else
		{
			return self + "ga"
		}
	}
}