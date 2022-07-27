//
//  expList.swift
//  phiLamp
//
//  Created by Артём Рябенко on 18.07.2022.
//

import SwiftUI
struct pickerView: View {
    @Binding var chosenColor: Color
    
    
    @State private var isDragging: Bool = false
    @State private var startLocation: CGFloat = 0 //260
    @State private var dragOffset: CGSize = .zero
    
    init(chosenColor: Binding<Color>) {
        self._chosenColor = chosenColor
    }
    
    private var colors: [Color] = {
        let hueValues = Array(0...359)
        return hueValues.map {
            Color(UIColor(hue: CGFloat($0) / 359.0 ,
                          saturation: 1.0,
                          brightness: 1.0,
                          alpha: 1.0))
        }
    }()
    
    // 2
    private var circleWidth: CGFloat {
        isDragging ? 35 : 15
    }
    
    private var linearGradientHeight: CGFloat = UIScreen.main.bounds.width * 0.85
    
   
    private var currentColor: Color {
        Color(UIColor.init(hue: self.normalizeGesture() / linearGradientHeight, saturation: 1.0, brightness: 1.0, alpha: 1.0))
    }
    
   
    private func normalizeGesture() -> CGFloat {
        let offset = startLocation + dragOffset.height
        let maxY = max(0, offset)
        let minY = min(maxY, linearGradientHeight)
        
        return minY
    }
    
    var body: some View {
        // 3
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: colors),
                           startPoint: .top,
                           endPoint: .bottom)
                .frame(width: 30, height: linearGradientHeight)
                .cornerRadius(35)
                .shadow(radius: 8)
                .overlay(
                        RoundedRectangle(cornerRadius: 35).stroke(Color.white, lineWidth: 2.0)
                )
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.dragOffset = value.translation
                            self.startLocation = value.startLocation.y
                            self.chosenColor = self.currentColor
                            self.isDragging = true // 4
                        })
                        // 5
                        .onEnded({ (_) in
                            self.isDragging = false
                        })
            )
            
            // 6
            Circle()
                .foregroundColor(self.currentColor)
                .frame(width: self.circleWidth, height: self.circleWidth, alignment: .center)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: self.circleWidth / 2.0).stroke(Color.white, lineWidth: 2.0)
                )
                .offset(x: self.isDragging ? -self.circleWidth : 0.0, y: self.normalizeGesture() - self.circleWidth / 2)
                .animation(Animation.spring().speed(2))
        }.rotationEffect(Angle(degrees: 90))
    }
}

struct pickerView_Previews: PreviewProvider {
    static var previews: some View {
        pickerView(chosenColor: Binding.constant(Color.white))
    }
}
