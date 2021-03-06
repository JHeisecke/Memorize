//
//  DeckThemes.swift
//  MemoryGame
//
//  Created by Javier Heisecke on 2022-03-20.
//

import Foundation

enum DeckThemes {
    case vehicles
    case animals
    case foods
    case people
    case flags
    case objects
    
    var color: Int {
        switch self {
        case .vehicles:
            return 0xccff33
        case .animals:
            return 0xccff99
        case .foods:
            return 0xff9966
        case .people:
            return 0xffcc00
        case .flags:
            return 0xcc0000
        case .objects:
            return 0xff6600
        }
    }
    
    var deck: [String] {
        switch self {
        case .vehicles:
            return ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðŧ"]
        case .animals:
            return ["ð", "ðĶ", "ðĶŦ", "ðĶĨ", "ðŋ", "ðĶ", "ðĶĪ", "ðĶ", "ðŊ"]
        case .foods:
            return ["ð§", "ðĨĪ", "ð°", "ð§", "ðĨ", "ðĨ", "ðŋ", "ð", "ð", "ðĨĐ", "ð", "ð", "ð"]
        case .people:
            return ["ðķðŧ", "ð§ðŧ", "ðĶð―", "ð§ðū", "ðĻðŋâðĶ°", "ðąð―ââïļ", "ðĐðžâðĶģ", "ðĐðžâðĶą", "ðģðŋ", "ðŪðū", "ð·ðŧ", "ð§ðŧ"]
        case .objects:
            return ["ð·", "ðļ", "ðđ", "ðĨ", "ð―", "ð", "ð", "âïļ", "ð", "ð ", "ðš", "ðŧ", "ð", "ð", "ðū", "âïļ", "ðą"]
        case .flags:
            return ["ðĶðŽ", "ðĶð·", "ðĶðē", "ðĶðž", "ðĶðš", "ðĶðđ", "ðĶðŋ", "ð§ðļ", "ð§ð­", "ð§ðĐ", "ð§ð§", "ðŠðš", "ðŠðđ", "ðļðŋ", "ðŠðŠ", "ðŠð·", "ðŽðķ", "ðļðŧ", "ðŠðŽ", "ðŠðĻ", "ðĐðī"]
        }
    }
    
    var localizedName: String {
        switch self {
        case .vehicles:
            return String(localized: "Vehicles")
        case .animals:
            return String(localized: "Animals")
        case .foods:
            return String(localized: "Foods")
        case .people:
            return String(localized: "People")
        case .flags:
            return String(localized: "Flags")
        case .objects:
            return String(localized: "Objects")
        }
    }
    var name: String {
        switch self {
        case .vehicles:
            return "Vehicles"
        case .animals:
            return "Animals"
        case .foods:
            return "Foods"
        case .people:
            return "People"
        case .flags:
            return "Flags"
        case .objects:
            return "Objects"
        }
    }
    
    
    var numberOfPairs: Int {
        switch self {
        case .animals:
            return 8
        case .vehicles:
            return 9
        case .people:
            return 10
        case .foods:
            return 11
        case .objects:
            return 12
        case .flags:
            return 21
        }
    }
    
    static var allOptions: [DeckThemes] {
        return [.animals, .vehicles, .people, .foods, .objects, .flags]
    }
    
    static var randomOption: DeckThemes {
        return allOptions.shuffled()[0]
    }
}
