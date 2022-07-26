//
//  UITextField+Extension.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2022-07-25.
//

import SwiftUI

extension String {
    func trimWhiteSpaces() -> String {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed
    }
}
