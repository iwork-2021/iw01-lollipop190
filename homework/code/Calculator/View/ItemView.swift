//
//  Item.swift
//  Calculator
//
//  Created by lollipop on 2021/10/5.
//

import SwiftUI

struct ItemView: View {
    let item: Item

    
    var width: CGFloat
    var height: CGFloat
    var itemSpacing: CGFloat
    var textFontsize: CGFloat
    let onTapFunc: () -> Void
    var isZero : Bool {
        return item.text == "0"
    }
    var body: some View {
        
        Button(action: onTapFunc){
            Text(item.text)
                .font(.system(size: textFontsize))
                .foregroundColor(Constants.fontColor)
                .frame(width: isZero ? (width * 2.0 + itemSpacing): width, height: height)
                .background(item.foreColor)
                .cornerRadius(width / 2.0)
                
        }
        

    }
    
    struct Constants {
        static let fontColor: Color = .white
   }

    
    
}

//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        let vm = ViewModel()
//        vm.isLandscape = false
//        return ItemView(item: vm.items[4][6], width: 85, height: 85, itemSpacing: 8, textFontsize: AdaptiveView.Constants.fontSizeV, onTapFunc: {})
//    }
//}
//struct ZeroToTheLeft: ViewModifier {
//    let isZero: Bool
//    let width: CGFloat
//    func body(content: Content) -> some View {
//        if isZero {
//            content.padding(.leading, width / 2.0 - AdaptiveView.Constants.fontSizeV / 1.5)
//        } else {
//            content
//        }
//    }
//
//
//}
//
//extension View {
//    func zeroToTheLeft(isZero: Bool, width: CGFloat) -> some View {
//        self.modifier(ZeroToTheLeft(isZero: isZero, width: width))
//    }
//}
//
//
//
