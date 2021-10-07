//
//  Item.swift
//  Calculator
//
//  Created by lollipop on 2021/10/5.
//

import Foundation
import SwiftUI
struct Item: Identifiable {
   
    
    static var idCount = 0
    static var newID: Int {
        let id = idCount
        idCount += 1
        return id
    }
    var id: Int = newID
    var foreColor: Color
    var text: String
    var isShown: Bool = true
  
    mutating func changeVisibility(_ isShown: Bool) {
        self.isShown = isShown
    }
    
    
    
}


