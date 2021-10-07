//
//  StackView.swift
//  Calculator
//
//  Created by lollipop on 2021/10/6.
//

import SwiftUI

struct StackView: View {
    var isLandscape = false
    var result: String
    var resultFontSize: CGFloat
    var textFontsize: CGFloat
    var items:[[Item]]
    var width: CGFloat
    var height: CGFloat
    var handleTap: (String) -> Void
    var itemSpacing: CGFloat
    var body: some View {
        VStack(spacing: isLandscape ? Constants.spacingBetwResultAndNumHorizonal : Constants.spacingBetwResultAndNumVertical) {

        Spacer()
        Text(result)
            .font(.system(size: resultFontSize ))
            .padding(.trailing, Constants.resultTrailingdistance)
            .lineLimit(1)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   alignment: .trailing)
        VStack(spacing: itemSpacing) {
            ForEach(0..<items.count){
                index in
                HStack{
                    ForEach(items[index]){ item in
                    HStack {
                        if item.isShown {
                            ItemView(item: item,width: width, height: height, itemSpacing: itemSpacing, textFontsize: textFontsize, onTapFunc : {
                                handleTap(item.text)
                            })
                        }
                        
                        }
                    }
                }
            }
        }.padding(.bottom)
    }
}
    
    struct Constants {
        static let resultTrailingdistance: CGFloat = 24
        static let spacingBetwResultAndNumVertical: CGFloat = 10
        static let spacingBetwResultAndNumHorizonal: CGFloat = 5

    }
    
}

//struct StackView_Previews: PreviewProvider {
//    static var previews: some View {
//        let vm = ViewModel()
//        let itemSpacing =  AdaptiveView.Constants.spacingBetItemV
//        let (width,height) = getWidthAndHeight(itemSpacing: itemSpacing, size: CGSize(width: 428, height: 845))
//
//        return StackView(result: vm.result, resultFontSize: AdaptiveView.Constants.resultFontSizeVertical, textFontsize: AdaptiveView.Constants.fontSizeV, items: vm.items, width: width, height: height, handleTap: vm.handleTap, itemSpacing: itemSpacing)
//    }
//
//    static func getWidthAndHeight(itemSpacing: CGFloat, size: CGSize) -> (CGFloat, CGFloat) {
//        let items = ViewModel().items
//        let itemCountPerRow = items.first?.count
//        let itemCountPercol = items.count
//        let itemSumWidth = size.width - CGFloat(itemCountPerRow!) * itemSpacing
//        let itemSumHgt = size.height * 0.9 - CGFloat(itemCountPerRow!) * itemSpacing
//        let width = floor( itemSumWidth / CGFloat(itemCountPerRow!) ) * (0.9)
//        let height = floor( itemSumHgt / CGFloat(itemCountPercol) ) * 0.9
//        return (width, height)
//    }
//
//}
