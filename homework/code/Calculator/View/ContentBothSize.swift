//
//  ContentBothSize.swift
//  Calculator
//
//  Created by lollipop on 2021/10/6.
//

import SwiftUI

struct ContentBothSize: View {
    @ObservedObject var viewModel = ViewModel()
    let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)

   
    var body: some View {
        AdaptiveView(isLandscape: viewModel.isLandscape, items: viewModel.items, result: viewModel.result, handleTap: viewModel.handleTap)
            .onReceive(orientationPublisher) {
                _ in
                let windowScene = UIApplication.shared.windows.first?.windowScene
                let isLandscape = (windowScene?.interfaceOrientation.isLandscape)!
                viewModel.changeOrientation(isLandscape)
                viewModel.isLandscape = isLandscape
            }

    }
}

@available(iOS 15.0, *)
struct ContentBothSize_Previews: PreviewProvider {
    static var previews: some View {
        ContentBothSize()
.previewInterfaceOrientation(.portrait)
    }
}
