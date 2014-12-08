
import Foundation


extension String {
	
	func plural() -> String {
		return self + "lar"
	}

	func question() -> String {
		return self + "mi"
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
	
	// MARK: VERBS
	
	// MARK: Personal pointers
	
	func me() -> String {
		return self + "man"
	}
	
	func you() -> String {
		return self + "san"
	}
	
	func youPlural() -> String {
		return self + "siz"
	}
	
	func we() -> String {
		return self + "miz"
	}
	
	func thirdPerson() -> String {
		
		switch last(self) as Character! {
		case "p":
			return self + "ti"
		default:
			return self + "di"
		}
	}
	
	func they() -> String {
		return self.thirdPerson().plural()
	}
	
	// MARK: Imperative
	
	func imperative() -> String {
		let shortVerb = self.stringByReplacingOccurrencesOfString("moq", withString: "", options: nil, range: nil)
		return shortVerb
	}
	
	func imperativePlural() -> String {
		let verb = self.imperative()
		
		switch last(verb) as Character! {
		case "a", "e", "i", "o", "u":
			return verb + "ng"
		default:
			return verb + "ing"
		}
	}
	
	func imperativeThirdPerson() -> String {
		return self.imperative() + "sin"
	}
	
	// MARK: Future-present tense
	
	func futurePresentMe() -> String {
		
		let verb = self.futurePresentBase()
		return verb.me()
	}
	
	func futurePresentYou() -> String {
		
		let verb = self.futurePresentBase()
		return verb.you()
	}
	
	func futurePresentYouPlural() -> String {
		
		let verb = self.futurePresentBase()
		return verb.youPlural()
	}
	
	func futurePresentWe() -> String {
		
		let verb = self.futurePresentBase()
		return verb.we()
	}
	
	func futurePresentThirdPerson() -> String {
		
		let verb = self.futurePresentBase()
		return verb.thirdPerson()
	}
	
	func futurePresentThey() -> String {
		return self.futurePresentThirdPerson().plural()
	}
	
	func futurePresentBase() -> String {
		
		let shortVerb = self.imperative()
		
		switch last(shortVerb) as Character! {
		case "a", "e", "i", "o", "u":
			return shortVerb + "y"
		default:
			return shortVerb + "a"
		}
	}
	
	// MARK: Present tense
	
	func presentBase() -> String {
		return self.imperative() + "yap"
	}
	
	func presentMe() -> String {
		return self.presentBase().me()
	}
	
	func presentYou() -> String {
		return self.presentBase().you()
	}

	func presentThirdPerson() -> String {
		return self.presentBase().thirdPerson()
	}
	
	func presentYouPlural() -> String {
		return self.presentBase().youPlural()
	}
	
	func presentWe() -> String {
		return self.presentBase().we()
	}
	
	func presentThey() -> String {
		return self.presentBase().they()
	}
	
	// MARK: Past tense
	
	func pastBase() -> String {
		return self.imperative().thirdPerson()
	}
	
	func pastMe() -> String {
		return self.pastBase().my()
	}
	
	func pastYou() -> String {
		return self.pastBase().your()
	}
	
	func pastThirdPerson() -> String {
		return self.pastBase()
	}
	
	func pastWe() -> String {
		return self.pastBase().our()
	}
	
	func pastYouPlural() -> String {
		return self.pastBase().yourPlural()
	}
	
	func pastThey() -> String {
		return self.pastBase().plural()
	}
}
