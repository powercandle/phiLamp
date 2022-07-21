//
//  ContentView.swift
//  phiLamp
//
//  Created by Артём Рябенко on 18.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var blur = 0.0
    @State private var redT = 0.0
    @State private var greenT = 0.0
    @State private var blueT = 0.0
    
    
    var body: some View {
        ZStack {
            VStack{
                Image("gradi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 300, alignment: .center)
                
                //Slider (value: $blur, in: 0...10, step: 1)
                Text("Hello, World!")
                    .padding()
                    .background(.green)
                    .shadow(color: redT < 30 ? .yellow : (redT < 60 ? .red : .green), radius: 35, x: 0, y: 0)
                    .animation(Animation.linear(duration: 1))
                
                //Divider()
                Slider (value: $redT, in: 0...100, step: 1)
                    .rotationEffect(.degrees(-90.0), anchor: .topLeading)
                    .offset(x: 14, y: 0)
                Image("argentina")
                    .resizable()
                    .frame(width: 110, height: 70)
                    .padding()
                    .colorMultiply(redT < 30 ? .yellow : (redT < 60 ? .red : .green))
                    .animation(Animation.linear(duration: 1))
                   //         .saturation(0.5)
                   //                .contrast(0.6)
                // .background(redT < 30 ? .yellow : (redT < 60 ? .red : .green)).animation(Animation.linear(duration: 1))}
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
