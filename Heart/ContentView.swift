//
//  ContentView.swift
//  Heart
//
//  Created by にゃんにゃん丸 on 2020/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isliked = false
    var body: some View {
        VStack {
            
            
            
            
            
            
            Text(isliked ? "ハート" : "は〜と")
                
                .foregroundColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                .font(.system(size: 50, weight: .bold, design: .default))
            HeartButton(isliked: $isliked)
        }
        
        
        
    }
}

struct HeartButton:View{
    @Binding var isliked:Bool
    
    private let animationduration : Double = 1
    private var animationscale : CGFloat{
        isliked ? 3 : 3
        
    }
    
    @State private var animate = false
    
    
    var body: some View{
        
        
        
        
        
        
        
        
        Button(action: {
            self.animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationduration
                                          , execute: {
                                            self.animate = false
                                            self.isliked.toggle()
                                            
                                            
                                          })
        }, label: {
            
            
            Image("image")
                .renderingMode(.original)
                .resizable()
                
                .frame(width: nil, height: nil)
                .overlay( Image(systemName: isliked ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .foregroundColor(isliked ? .red : .purple)
                     )
            
            
            
            Spacer()
            
        })
        .scaleEffect(animate ? animationscale : 1)
        .animation(.easeIn(duration: animationduration))
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
