//
//  ContentView.swift
//  SwiftUI_matchedGeometryEffect
//
//  Created by 김선중 on 2021/04/30.
//

import SwiftUI

struct ContentView: View {
    @State private var isZoomed = false
    @Namespace private var animation
    
    var frame: CGFloat {
        isZoomed ? .infinity : 60
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            
            VStack {
                
                HStack {
                    Image("Rollin")
                        .resizable()
                        .scaledToFill()
                        //isZoomed가 true이면 프레임 400 fales이면 50
                        .frame(width: frame, height: frame)
                        .padding([.top,.bottom], isZoomed ? 10 : 0)
                    
                    
                    if isZoomed == false {
                        Text("브레이브 걸스 - Rollin'")
                            .matchedGeometryEffect(id: "title", in: animation)
                            .font(.headline)
                        Spacer()
                    }
                }
                if isZoomed != false {
                    Text("브레이브 걸스 - Rollin'")
                        .matchedGeometryEffect(id: "title", in: animation)
                        .font(.headline)
                        .padding([.vertical, .horizontal], 10)
                    
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    isZoomed.toggle()
                }
            }
            
            .frame(maxWidth: .infinity)
            .frame(height: .infinity)
            .background(Color(white: 0.98))
            .foregroundColor(.primary)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
