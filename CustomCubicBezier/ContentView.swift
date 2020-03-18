//
//  ContentView.swift
//  CustomCubicBezier
//
//  Created by Ramill Ibragimov on 18.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var locked = false
    @State private var tilted = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 64, height: 64)
                .cornerRadius(6)
                .foregroundColor(Color.orange)
            
            Capsule()
                .trim(from: locked ? 0 : 3/5, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 44, height: 74)
                .foregroundColor(Color.orange)
                .offset(y: -30)
                .animation(Animation.easeInOut.delay(0.5).repeatCount(1, autoreverses: true))
                .onAppear() {
                    self.locked.toggle()
            }
        }.rotationEffect(.degrees(tilted ? 0 : 30))
            .animation(Animation.easeInOut.delay(0.5).repeatCount(1, autoreverses: true))
            .onAppear() {
                self.tilted.toggle()
        }.onTapGesture {
            self.locked.toggle()
            self.tilted.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
