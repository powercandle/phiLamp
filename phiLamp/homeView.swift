//
//  homeView.swift
//  phiLamp
//
//  Created by Артём Рябенко on 27.07.2022.
//

import SwiftUI

struct homeView: View {
    
    @State var gradientColor:Color = .clear
    
    
    var body: some View {
        ZStack {
            gradientColor.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack{
            
                HStack(spacing: 16){
                    Text("Products")
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 3, height: 12)
                    Text("Explore Hue")
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 3, height: 12)
                    Text("Support")
                } .foregroundColor(.white)
                    .padding()
                   
              
                
                Text("Create a personalized experience with colorful smart light")
                    .foregroundColor(.white)
                    .font(.system(size: 34, design: .rounded))
                    .bold()
                    .padding(.leading, 16)
                  //  .padding(.horizontal, 10)
                    .padding()
                  
                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 50, height: 50)
                                   .shadow(color: gradientColor, radius: 95, x: 5, y: -5)
                                 .foregroundColor(gradientColor)
                                  .padding(.trailing, UIScreen.main.bounds.width * 0.3)
                                  .offset(x: 0 , y: 60)
                                  .blur(radius: 40)
                
                
                Spacer()
             
         
                Text("Transform your home with over 16 million colors, instantly creating the right atmosphere for any event. ")
                    .font(.title3)
                       .foregroundColor(.white)
                       .padding(.leading, 16)
                      // .padding(.horizontal, 16)
                       .padding(.bottom, 30)
                       .padding()
                
            pickerView(chosenColor: $gradientColor)
                .frame(width: 50, height: 50)
                .padding(.leading, 16)
                
            }
            
           
        }.background(alignment: .leading, content: {
            (Image("fon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                           
                        )
        })
     
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}


                
