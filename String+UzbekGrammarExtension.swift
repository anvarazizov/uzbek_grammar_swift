//
//  String+UzbekGrammarExtension.swift
//  
//
//  Created by Anvar Azizov on 14/12/06.
//
//

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
	
	// MARK: VERBS
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
		return verb + "man"
	}
	
	func futurePresentYou() -> String {
		
		let verb = self.futurePresentBase()
		return verb + "san"
	}
	
	func futurePresentYouPlural() -> String {
		
		let verb = self.futurePresentBase()
		return verb + "siz"
	}
	
	func futurePresentWe() -> String {
		
		let verb = self.futurePresentBase()
		return verb + "miz"
	}
	
	func futurePresentThirdPerson() -> String {
		
		let verb = self.futurePresentBase()
		return verb + "di"
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
	
	// MARK: Past tense
	
	func pastBase() -> String {
		return self.imperative() + "di"
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
