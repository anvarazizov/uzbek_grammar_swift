
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
	
	// MARK: Possessive
	
	func my() -> String {
		
		switch last(self) as Character! {
		case "a", "e", "i", "o", "u":
			return self + "m"
		case "k":
			return dropLast(self) + "gim"
		case "q":
			return dropLast(self) + "g'im"
		default:
			return self + "im"
		}
	}
	
	func your() -> String {
		
		switch last(self) as Character! {
		case "a", "e", "i", "o", "u":
			return self + "ng"
		case "k":
			return dropLast(self) + "ging"
		case "q":
			return dropLast(self) + "g'ing"
		default:
			return self + "ing"
		}
	}
	
	func yourPlural() -> String {
		return self.your() + "iz"
	}
	
	func his() -> String {
		
		switch last(self) as Character! {
		case "a", "e", "i", "o", "u":
			return self + "si"
		case "k", "q":
			return dropLast(self) + "i"
		default:
			return self + "i"
		}
	}
	
	func their() -> String {
		
		switch last(self) as Character! {
		case "k", "q":
			return dropLast(self) + "lari"
		default:
			return self + "lari"
		}
	}
	
	func our() -> String {
		
		switch last(self) as Character! {
		case "a", "e", "i", "o", "u":
			return self + "miz"
		case "k":
			return dropLast(self) + "gimiz"
		case "q":
			return dropLast(self) + "g'imiz"
		default:
			return self + "imiz"
		}
	}
}
