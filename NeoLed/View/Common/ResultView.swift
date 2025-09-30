//
//  ResultView.swift
//  NeoLed
//

import SwiftUI

struct ResultView: View {
    let text: String
    let selectedFont: String
    let textSize: CGFloat
    let strokeSize: CGFloat
    let selectedColor: ColorOption
    let selectedOutlineColor: OutlineColorOption
    let outlineEnabled: Bool
    let hasCustomTextColor: Bool
    let customTextColor: UIColor

    let selectedEffects: Set<String>  // Keep this
    let selectedAlignment: String
    let selectedShape: String
    let textSpeed: CGFloat
    
      private var isBold: Bool { selectedEffects.contains("Bold") }
      private var isLight: Bool { selectedEffects.contains("Light") }
      private var isFlash: Bool { selectedEffects.contains("Flash") }
      private var isMirror: Bool { selectedEffects.contains("Mirror") }
    var onBack: () -> Void
  
    @State private var isFlashing = false
    @State var offset: CGFloat = 0

    @State var show = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            GeometryReader { geo in
                
                ZStack {
            
                    getShapeImage()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .opacity(0.1)
                   
                }
                    
                ZStack {
                    // Blurred glow layers behind
                    Text(text)
                        .font(.custom(selectedFont, size: textSize * 100))
                        .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                        .modifier(ColorModifier(colorOption: selectedColor))
                        .blur(radius: isLight ? 40 : 5)
                        .opacity(isLight ? 0.5 : 1)
                    
                    Text(text)
                        .font(.custom(selectedFont, size: textSize * 100))
                        .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                        .modifier(ColorModifier(colorOption: selectedColor))
                        .blur(radius: isLight ? 20 : 10)
                        .opacity(isLight ? 0.7 : 1)
                    
                    // Sharp text on top
                    Text(text)
                        .font(.custom(selectedFont, size: textSize * 100))
                        .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                        .modifier(ColorModifier(colorOption: selectedColor))
                        .brightness(0.1)
                        .opacity(isFlash && !isFlashing ? 0.3 : 1.0)
                  }
                    .scaleEffect(x: isMirror ? -1 : 1, y: 1) // Mirror effect
                    .frame(height: 200)
                    .fixedSize()
                    .offset(x: isMirror ? show ?  1160 : -500 : show ? -500 : 1160)
                    .rotationEffect(.degrees(isMirror ? 90 : -270))
                    .position(x: geo.size.width / 2)
                    .mask {
                        getShapeImage()
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            offset = geo.size.height + textSize / 2
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                                offset = -textSize / 2
                            }
                        }
                        
                        // Flash effect
                                       if isFlash {
                                           Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                                               withAnimation(.easeInOut(duration: 0.3)) {
                                                   isFlashing.toggle()
                                               }
                                           }
                                       }
                    }
                
  
            }
            
            
            HStack {
                
                Button {
                    onBack()
                } label: {
                    Image(.backIcon)
                        .resizable()
                        .frame(width: ScaleUtility.scaledValue(34), height: ScaleUtility.scaledValue(34))
                }

        
                Spacer()
                
                HStack(spacing: ScaleUtility.scaledSpacing(14.57)) {
                    
                    Image(.shareIcon1)
                        .resizable()
                        .frame(width: ScaleUtility.scaledValue(19.42857), height: ScaleUtility.scaledValue(19.42857))
                        .padding(.all, ScaleUtility.scaledSpacing(7.29))
                        .background {
                                EllipticalGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                        Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                    ],
                                    center: UnitPoint(x: 0.36, y: 0.34)
                                )
                         
                        }
                        .cornerRadius(4.04762)
                        .overlay {
                            RoundedRectangle(cornerRadius: 4.04762)
                                .stroke(Color.accent , lineWidth: 1)
                            
                        }
                    
                    Image(.downloadIcon)
                        .resizable()
                        .frame(width: ScaleUtility.scaledValue(19.42857), height: ScaleUtility.scaledValue(19.42857))
                        .padding(.all, ScaleUtility.scaledSpacing(7.29))
                        .background {
                                EllipticalGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                        Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                    ],
                                    center: UnitPoint(x: 0.36, y: 0.34)
                                )
                         
                        }
                        .cornerRadius(4.04762)
                        .overlay {
                            RoundedRectangle(cornerRadius: 4.04762)
                                .stroke(Color.accent , lineWidth: 1)
                            
                        }
                    
                }
            }
            .padding(.horizontal,ScaleUtility.scaledSpacing(28))
            .padding(.top,ScaleUtility.scaledSpacing(59))
            
        }
        .background(Color.black.ignoresSafeArea(.all))
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
        .onAppear(){
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                show.toggle()
            }
        }
    }
    
    private func getShadowColor() -> Color {
        switch selectedColor.type {
        case .solid(let color):
            return color
        case .linearGradient(let gradientData):
            // Use the first color from the gradient for glow
            return gradientData.stops.first?.color ?? .white
        }
    }
    
    @ViewBuilder
    private func getShapeImage() -> some View {
        switch selectedShape {
        case "circle":
            Image(.circle)
                .resizable().scaledToFill()
        case "square":
            Image(.square)
                .resizable().scaledToFill()
        case "heart":
            Image(.heart)
                .resizable().scaledToFill()
        case "star":
            Image(.star)
                .resizable().scaledToFill()
        case "ninjaStar":
            Image(.ninjaStar)
                .resizable().scaledToFill()
        default: // "None" or any other case
            Image(.circle)
        }
    }
}

  
