//
//  ViewModel.swift
//  Calculator
//
//  Created by lollipop on 2021/10/5.
//

import Foundation
import SwiftUI
class ViewModel: ObservableObject {
    static let numColor = Color(red: 51.0 / 255.0, green: 51.0 / 255.0, blue: 51.0 / 255.0)
    static let topGrey = Color(red: 165.0 / 255.0, green: 165.0 / 255.0, blue: 165.0 / 255.0)
    static let sideGrey = Color(red: 33.0 / 255.0, green: 33.0 / 255.0, blue: 33.0 / 255.0)
    static let content = [["C","+/-","%","/"],["7","8","9","x"],["4","5","6","-"],["1","2","3","+"],["0",".","="]]
    static let extendContent = [
        [
        "(", ")", "mc", "m+", "m-", "mr"
        ],
        [
        "2nd", "x^2", "x^3", "x^y" , "e^x", "10^x"
        ],
        [
        "1/x", "2√x", "3√x", "y√x", "ln", "log10"
        ],
        [
        "x!","sin","cos","tan","e","EE"
        ],
        [
        "Deg", "sinh", "cosh", "tanh", "π", "Rand"
        ]
    
    ]
    @Published private(set) var model = CalculatorModel(items: Items)
    var isLandscape: Bool {
        get {
            model.isLandscape
        }
        set {
            model.isLandscape = newValue
        }
       
    }
    var result: String{
        return model.showedResult
    }
    
    var items: [[Item]] {
        return model.items
    }
    
    
    
    static var Items = [
        [
            Item(foreColor: sideGrey, text: extendContent[0][0], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[0][1], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[0][2], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[0][3], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[0][4], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[0][5], isShown: false),
            Item(foreColor: topGrey, text: content[0][0]),
            Item(foreColor: topGrey, text: content[0][1]),
            Item(foreColor: topGrey, text: content[0][2]),
            Item(foreColor: .orange, text: content[0][3]),
        ],
        [
            Item(foreColor: sideGrey, text: extendContent[1][0], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[1][1], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[1][2], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[1][3], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[1][4], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[1][5], isShown: false),
            Item(foreColor: .black, text: content[1][0]),
            Item(foreColor: .black, text: content[1][1]),
            Item(foreColor: .black, text: content[1][2]),
            Item(foreColor: .orange, text: content[1][3]),
        ],
        [
            Item(foreColor: sideGrey, text: extendContent[2][0], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[2][1], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[2][2], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[2][3], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[2][4], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[2][5], isShown: false),
            Item(foreColor: .black, text: content[2][0]),
            Item(foreColor: .black, text: content[2][1]),
            Item(foreColor: .black, text: content[2][2]),
            Item(foreColor: .orange, text: content[2][3]),
        ],
        [
            Item(foreColor: sideGrey, text: extendContent[3][0], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[3][1], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[3][2], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[3][3], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[3][4], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[3][5], isShown: false),
            Item(foreColor: .black, text: content[3][0]),
            Item(foreColor: .black, text: content[3][1]),
            Item(foreColor: .black, text: content[3][2]),
            Item(foreColor: .orange, text: content[3][3]),
        ],
        [
            Item(foreColor: sideGrey, text: extendContent[4][0], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[4][1], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[4][2], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[4][3], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[4][4], isShown: false),
            Item(foreColor: sideGrey, text: extendContent[4][5], isShown: false),
            Item(foreColor: .black, text: content[4][0]),
            Item(foreColor: .black, text: content[4][1]),
            Item(foreColor: .orange, text: content[4][2]),
        ],
    ]
    
    
    func handleTap(itemText: String) {
        model.handleTap(itemText: itemText)
    }
    
    func changeOrientation(_ isLandscape: Bool) {
        model.changeOrientation(isLandscape)
        
    }
    
    
    
    
}

