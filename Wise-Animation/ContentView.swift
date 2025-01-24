//
//  ContentView.swift
//  Wise-Animation
//
//  Created by Alfeu Panzo Bena on 24/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.5
    @State private var rotation: Double = 0
    @State private var opacity = 1.0
    
    var body: some View {
        if isActive {
            ContentViewTwo()
        } else {
            ZStack {
                Color.black.ignoresSafeArea()
                
                Image("wise")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.interpolatingSpring(stiffness: 50, damping: 10)) {
                            scale = 1.2
                            rotation = 360
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation(.easeOut(duration: 1.0)) {
                                opacity = 0.0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                isActive = true
                            }
                        }
                    }
            }
        }
    }
}


struct ContentViewTwo: View {
    @State private var isActive = false
    @State private var logoOffsetY: CGFloat = 300
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    @State private var backgroundScale: CGFloat = 1.0
    
    var body: some View {
        if isActive {
            HomeView()
        } else {
            ZStack {
                Color.white
                    .scaleEffect(backgroundScale)
                    .ignoresSafeArea()
                
                Image("wise")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .offset(y: logoOffsetY)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.spring(response: 1.2, dampingFraction: 0.7, blendDuration: 1.0)) {
                            logoOffsetY = 0
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            withAnimation(.easeInOut(duration: 1.2)) {
                                scale = 30
                                opacity = 0
                                backgroundScale = 0
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                isActive = true
                            }
                        }
                    }
            }
        }
    }
}


struct HomeView: View {
    var body: some View {
        VStack {
            Text("Bem-vindo ao Wise")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
    }
}


#Preview {
    ContentView()
}
