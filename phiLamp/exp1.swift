//
//  exp1.swift
//  phiLamp
//
//  Created by Артём Рябенко on 21.07.2022.
//

import SwiftUI


struct exp1: View {
    @State var currentColor: Color = .clear
   @State var currentColor2 = Color(UIColor(hue: 260,
                  saturation: 1.0,
                  brightness: 1.0,
                  alpha: 1.0))
    
    var body: some View {
        VStack {
           
            Image("lamp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 270)
                .shadow(color: currentColor, radius: 95, x: 5, y: -5)
                .shadow(color: currentColor, radius: 95, x: 5, y: -5)
                .shadow(color: currentColor, radius: 95, x: 5, y: -5)
                .padding(.top, 150)
            
            Spacer()
            pickerView(chosenColor: $currentColor)
                .frame(width: 50, height: 250)
               // .offset(x: 0, y: 75)
                .rotationEffect(.degrees(90))
        }.edgesIgnoringSafeArea(.all)
    }
}

struct exp1_Previews: PreviewProvider {
    static var previews: some View {
        exp1()
    }
}
