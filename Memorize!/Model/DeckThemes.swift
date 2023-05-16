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
    case test
    
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
        case .test:
            return 0x27408b
        }
    }
    
    var deck: [String] {
        switch self {
        case .vehicles:
            return ["🚙", "🚎", "🚗", "🚕", "🚌", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻"]
        case .animals:
            return ["🐒", "🦅", "🦫", "🦥", "🐿", "🦔", "🦤", "🦁", "🐯"]
        case .foods:
            return ["🧋", "🥤", "🍰", "🧅", "🥔", "🥐", "🍿", "🍖", "🍗", "🥩", "🍔", "🍟", "🍕"]
        case .people:
            return ["👶🏻", "🧒🏻", "👦🏽", "👧🏾", "👨🏿‍🦰", "👱🏽‍♀️", "👩🏼‍🦳", "👩🏼‍🦱", "👳🏿", "👮🏾", "👷🏻", "🧕🏻"]
        case .objects:
            return ["📷", "📸", "📹", "🎥", "📽", "🎞", "📞", "☎️", "📟", "📠", "📺", "📻", "🎙", "📀", "💾", "⌚️", "📱"]
        case .flags:
            return ["🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇪🇺", "🇪🇹", "🇸🇿", "🇪🇪", "🇪🇷", "🇬🇶", "🇸🇻", "🇪🇬", "🇪🇨", "🇩🇴"]
        case .test:
            return ["🪲", "🍏"]
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
        case .test:
            return String("test")
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
        case .test:
            return "Test"
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
        case .test:
            return 2
        }
    }
    
    static var allOptions: [DeckThemes] {
        #if DEBUG
        return [.animals, .vehicles, .people, .foods, .objects, .flags, .test]
        #else
        return [.animals, .vehicles, .people, .foods, .objects, .flags]
        #endif
    }
    
    static var randomOption: DeckThemes {
        return allOptions.shuffled()[0]
    }
}
