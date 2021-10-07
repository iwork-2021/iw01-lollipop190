//
//  ContentView.swift
//  Calculator
//
//  Created by lollipop on 2021/9/29.
//

import SwiftUI

struct AdaptiveView: View {
    var isLandscape: Bool
    var items: [[Item]]
    var result: String
    var handleTap: (String) -> Void
    var resultFontSize: CGFloat {
        return isLandscape ? Constants.resultFontSizeHorizonal : Constants.resultFontSizeVertical
    }
    var textFontSize: CGFloat {
        return isLandscape ? Constants.fontSizeH : Constants.fontSizeV
    }

    
    var body: some View {
        GeometryReader {
            geometry in
            let itemSpacing = isLandscape ? Constants.spacingBetItemH : Constants.spacingBetItemV
            let (width,height) = getWidthAndHeight(itemSpacing: itemSpacing, size: geometry.size)
            StackView(isLandscape: isLandscape, result: result, resultFontSize: resultFontSize, textFontsize: textFontSize, items: items, width: width,height: (isLandscape ? height: width), handleTap: handleTap, itemSpacing: itemSpacing)
           
        }
    }
    
    func getWidthAndHeight(itemSpacing: CGFloat, size: CGSize) -> (CGFloat, CGFloat) {
        let itemCountPerRow = items.first?.filter {
            $0.isShown
        }.count
        let itemCountPercol = items.count
        let itemSumWidth = size.width - CGFloat(itemCountPerRow!) * itemSpacing
        let itemSumHgt = size.height * 0.9 - CGFloat(itemCountPerRow!) * itemSpacing
        let width = floor( itemSumWidth / CGFloat(itemCountPerRow!) ) * (isLandscape ? Constants.widthScaleH: Constants.widthScaleV)
        let height = floor( itemSumHgt / CGFloat(itemCountPercol) ) * Constants.heightSCale
        return (width, height)
    }
    struct Constants {
        static let spacing: CGFloat = 8
        //todo make the resultFontSize dynamic
        static let resultFontSizeVertical: CGFloat = 76
        static let resultFontSizeHorizonal: CGFloat = 50
        static let resultTrailingdistance: CGFloat = 24
        static let spacingBetwResultAndNumVertical: CGFloat = 10
        static let spacingBetwResultAndNumHorizonal: CGFloat = 5
        static let spacingBetItemH : CGFloat = 8
        static let spacingBetItemV : CGFloat = 4
        static let fontSizeV: CGFloat = 45
        static let fontSizeH: CGFloat = 20
        static let heightSCale: CGFloat = 0.9
        static let widthScaleH: CGFloat = 1
        static let widthScaleV: CGFloat = 0.9
    }
  
}



@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        let viewmodel = ViewModel()
        return AdaptiveView(isLandscape: false, items: viewmodel.items, result: viewmodel.result, handleTap: viewmodel.handleTap)
.previewInterfaceOrientation(.landscapeLeft)
//        viewmodel.isLandscape = true
//        return AdaptiveView(viewModel: viewmodel, isLandscape: true)
//.previewInterfaceOrientation(.landscapeRight)
    }
}
