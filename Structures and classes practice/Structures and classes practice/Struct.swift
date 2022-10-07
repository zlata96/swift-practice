//
//  Struct.swift
//  Structures and classes practice
//
//  Created by Zlata Guseva on 08/10/2022.
//

import Foundation

struct StructHero {
    var name: String
    var universe: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}

