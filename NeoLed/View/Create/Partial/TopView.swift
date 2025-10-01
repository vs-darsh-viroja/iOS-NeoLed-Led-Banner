//
//  TopView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 26/09/25.
//

import Foundation
import SwiftUI

struct TopView:View {
    
    @Binding var text: String
    @Binding var selectedFont: String
    @Binding var textSize: CGFloat
    @Binding var strokeSize: CGFloat
    @Binding var selectedColor: ColorOption
    @Binding var selectedOutlineColor: OutlineColorOption
    @Binding var outlineEnabled: Bool
    @Binding var hasCustomTextColor: Bool
    @Binding var customTextColor: UIColor

    @Binding var selectedEffects: Set<String>  // Keep this
    @Binding var selectedAlignment: String
    @Binding var selectedShape: String
    @Binding var textSpeed: CGFloat
    @Binding var isHD: Bool
    
    private var isBold: Bool { selectedEffects.contains("Bold") }
    private var isLight: Bool { selectedEffects.contains("Light") }
    private var isFlash: Bool { selectedEffects.contains("Flash") }
    private var isMirror: Bool { selectedEffects.contains("Mirror") }
    
    @FocusState.Binding var isInputFocused: Bool
    var showPreview: () -> Void
    
    @State var offsetx: CGFloat = 0
    @State var offsety: CGFloat = 0
    @State var textWidth: CGFloat = 0
    @State var show = false
    @State private var flashTimer: Timer?
    @State private var isFlashing = false
    
    var body: some View {
        VStack(spacing: ScaleUtility.scaledSpacing(30)) {
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal, ScaleUtility.scaledSpacing(20))
                    .overlay {
                        if text == "" {
                            Text("Enter Your Text")
                                .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(36)))
                                .foregroundColor(.black)
                                .padding(.horizontal,ScaleUtility.scaledSpacing(36))
                        }
                    }
          
                
                GeometryReader { geo in
                    
                    ZStack {
                
                        if !isHD {
                            getShapeImage()
                                .frame(width: geo.size.width, height: geo.size.height)
                                .opacity(0.1)
                        }
       
                    }
                        
                    ZStack {
                        // Blurred glow layers behind
                        if strokeSize > 0.2 {
                            StrokeText(
                                text: text,
                                width: strokeSize,
                                color: outlineEnabled ? selectedOutlineColor.color : .white,
                                font: .custom(selectedFont, size: textSize * 100),
                                fontWeight: isBold ? .heavy : (isLight ? .light : .regular)
                            )
                            .modifier(ColorModifier(colorOption: selectedColor))
                            .blur(radius: isLight ? 2 : 0)
                            .opacity(isLight ? 0.8 : 1)
                        } else {
                            Text(text)
                                .font(.custom(selectedFont, size: textSize * 100))
                                .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                                .modifier(ColorModifier(colorOption: selectedColor))
                                .blur(radius: isLight ? 2 : 0)
                                .opacity(isLight ? 0.8 : 1)
                        }
                        
                        if strokeSize > 0.2 {
                            StrokeText(
                                text: text,
                                width: strokeSize,
                                color: outlineEnabled ? selectedOutlineColor.color : .white,
                                font: .custom(selectedFont, size: textSize * 100),
                                fontWeight: isBold ? .heavy : (isLight ? .light : .regular)
                            )
                            .kerning(0.6)
                            .modifier(ColorModifier(colorOption: selectedColor))
                            .blur(radius: isLight ? 5 : 0)
                            .opacity(isLight ? 0.9 : 1)
                        } else {
                            Text(text)
                                .font(.custom(selectedFont, size: textSize * 100))
                                .kerning(0.4)
                                .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                                .modifier(ColorModifier(colorOption: selectedColor))
                                .blur(radius: isLight ? 5 : 0)
                                .opacity(isLight ? 0.9 : 1)
                        }
                        
                        // Sharp text on top
//                        if strokeSize > 0.2 {
//                            StrokeText(
//                                text: text,
//                                width: strokeSize,
//                                color: outlineEnabled ? selectedOutlineColor.color : .white,
//                                font: .custom(selectedFont, size: textSize * 100),
//                                fontWeight: isBold ? .heavy : (isLight ? .light : .regular)
//                            )
//                            .modifier(ColorModifier(colorOption: selectedColor))
//                            .brightness(0.1)
//                            .opacity(isFlash && !isFlashing ? 0.3 : 1.0)
//                        } else {
//                            Text(text)
//                                .font(.custom(selectedFont, size: textSize * 100))
//                                .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
//                                .modifier(ColorModifier(colorOption: selectedColor))
//                                .brightness(0.1)
//                                .opacity(isFlash && !isFlashing ? 0.3 : 1.0)
//                        }
                    }
                    .scaleEffect(x: isMirror ? -1 : 1, y: 1)
                    .frame(height: 50)
                    .fixedSize()
                    .background { GeometryReader { textgeometry -> Color in
                        DispatchQueue.main.async {
                            self.textWidth = textgeometry.size.width
                        }
                        return Color.clear
                     }
                    }
                    .offset(x: getPreviewOffsetX(geo: geo), y: getPreviewOffsetY())
                    .rotationEffect(.degrees(getRotation()))
                    .position(x: geo.size.width / 2)
                    .if(!isHD) { view in
                        view.mask {
                            getShapeImage()
                                .frame(width: geo.size.width, height: geo.size.height)
                        }
                    }
                    .onChange(of: textSpeed) { 
                        restartAnimation(geo: geo)
                    }
                    .onChange(of: selectedAlignment) {
                        restartAnimation(geo: geo)
                    }
                    .onChange(of: text) {
                        restartAnimation(geo: geo)
                    }
                    .onChange(of: selectedShape) {
                        restartAnimation(geo: geo)
                    }
                    .onChange(of: textSize) {
                        restartAnimation(geo: geo)
                    }
                    .onChange(of: strokeSize) {
                        restartAnimation(geo: geo)
                    }
                    .onChange(of: selectedAlignment) {
                        restartAnimation(geo: geo)
                    }
                    .onChange(of: isHD) {
                        restartAnimation(geo: geo)
                    }
                    .onAppear() {
                        restartAnimation(geo: geo)
               
                    }
                    .onDisappear {
                        flashTimer?.invalidate()
                        flashTimer = nil
                    }
      
                }
                .frame(width: ScaleUtility.scaledValue(335), height: ScaleUtility.scaledValue(147))
                .clipped()
                .padding(.horizontal, ScaleUtility.scaledSpacing(20))
            }
            
//            Rectangle()
//                .foregroundColor(.clear)
//                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
//                .frame(maxWidth: .infinity)
//                .background(
//                    LinearGradient(
//                        stops: [
//                            Gradient.Stop(color: Color(red: 1, green: 0.73, blue: 0.79), location: 0.00),
//                            Gradient.Stop(color: Color(red: 1, green: 0.84, blue: 0.6), location: 1.00),
//                        ],
//                        startPoint: UnitPoint(x: 0.5, y: 0),
//                        endPoint: UnitPoint(x: 0.5, y: 1)
//                    )
//                )
//                .cornerRadius(10)
//                .overlay {
//                    
//                    if text == "" {
//                        Text("Enter Your Text")
//                            .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(36)))
//                            .foregroundColor(.black)
//                            .padding(.horizontal)
//                    }
//                    else {
//                        
//                        ScrollView {
//                            Text(text)
//                                .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(36)))
//                                .foregroundColor(.black)
//                                .padding(.horizontal)
//                            
//                        }
//                    }
//                }
//                .padding(.horizontal,ScaleUtility.scaledSpacing(20))
            
            HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            EllipticalGradient(
                                stops: [
                                    Gradient.Stop(color: .white.opacity(0.1), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.1), location: 0.78),
                                ],
                                center: UnitPoint(x: 0.36, y: 0.34)
                            )
                        )
                        .frame(height:ScaleUtility.scaledValue(37) * heightRatio)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primaryApp.opacity(0.15), lineWidth: 1)
                                .foregroundColor(Color.clear)
                                .frame(height:ScaleUtility.scaledValue(37) * heightRatio)
                        }
                    
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text("Enter Your Text")
                                .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(14)))
                                .foregroundColor(Color.primaryApp)
                                .background(Color.clear)
                               
                        }
                        
                        TextField("", text: $text)
                            .focused($isInputFocused)
                            .foregroundColor(Color.primaryApp)
                            .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(14)))
                            .padding(.vertical, ScaleUtility.scaledSpacing(10))
                            .textFieldStyle(PlainTextFieldStyle()) // <- Most important
                            .padding(.trailing,ScaleUtility.scaledSpacing(18))
                    }
                    .offset(x: ScaleUtility.scaledSpacing(15))
                    
                }
                
                Button {
                    showPreview()
                } label: {
                    
                    Text("Preview")
                      .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(14)))
                      .kerning(0.42)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                      .padding(.vertical, ScaleUtility.scaledSpacing(9))
                      .padding(.horizontal, ScaleUtility.scaledSpacing(18))
                      .background(
                        EllipticalGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                            ],
                            center: UnitPoint(x: 0.36, y: 0.34)
                        )
                      )
                      .cornerRadius(5)
                      .overlay {
                          RoundedRectangle(cornerRadius: 5)
                              .stroke(.accent, lineWidth: 1)
                      }
                }

                
    
            }
            .padding(.horizontal,ScaleUtility.scaledSpacing(20))
            
        }
        .padding(.top, ScaleUtility.scaledSpacing(59))
    }
    
    private func restartAnimation(geo: GeometryProxy) {
        // Cancel any existing animations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            withAnimation(.linear(duration: 0)) {
                switch selectedAlignment {
                case "up":
                    offsety = geo.size.height + textWidth / 2
                case "down":
                    offsety = -(geo.size.height + textWidth / 2)
                case "left", "None":
                    offsetx = geo.size.height + textWidth / 2
                case "right":
                    offsetx = -(geo.size.height + textWidth / 2)
                default:
                    offsetx = geo.size.height + textWidth / 2
                }
            }
        }
        
        // Start new animation after a brief delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let animationDuration = 10.0 / textSpeed
            
            withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                switch selectedAlignment {
                case "up":
                    offsety = -textWidth / 2
                case "down":
                    offsety = geo.size.height + textWidth / 2
                case "left", "None":
                    offsetx = -textWidth / 2
                case "right":
                    offsetx = geo.size.height + textWidth / 2
                default:
                    offsetx = -textWidth / 2
                }
            }
        }
        
        // Invalidate existing flash timer
        flashTimer?.invalidate()
        flashTimer = nil
        
        // Flash effect
        if isFlash {
              flashTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                  withAnimation(.easeInOut(duration: 0.3)) {
                      isFlashing.toggle()
                  }
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
            Image(.circle2)
                .resizable()
                .scaledToFit()
                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
            
        case "square":
            Image(.square2)
                .resizable().scaledToFit()
                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
             
        case "heart":
            Image(.heart2)
                .resizable().scaledToFit()
                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
               
        case "star":
            Image(.star2)
                .resizable()
                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
               
        case "ninjaStar":
            Image(.ninjaStar2)
                .resizable()
                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
            
        default: // "None" or any other case
            Image(.circle2)
                .resizable()
                .frame(width: ScaleUtility.scaledValue(335) ,height: ScaleUtility.scaledValue(147))
       
        }
    }
    private func getPreviewOffsetX(geo: GeometryProxy) -> CGFloat {
        switch selectedAlignment {
        case "up", "down":
            return 5
        case "left", "right":
            return offsetx // Centered for horizontal scroll
        default:
            return isMirror ? offsetx : offsetx
        }
    }

    private func getPreviewOffsetY() -> CGFloat {
        switch selectedAlignment {
        case "left", "right":
            return 80 // Position for horizontal scroll
        case "up", "down":
            return offsety // Use offsety for vertical movement
        default:
            return 80
        }
    }
    
    private func getRotation() -> Double {
        switch selectedAlignment {
        case "left":
            return 0
        case "right":
            return 0
        case "up":
            return 0  // Rotate for vertical scroll
        case "down":
            return 0   // Rotate opposite direction
        default:
            return 0
        }
    }
    
    
//    
//    private func getOffsetX() -> CGFloat {
//        switch selectedAlignment {
//        case "up", "down":
//            return offsetx
//        case "left", "right":
//            return 420 // Center horizontally for left/right scrolling
//        default:
//            return isMirror ? (show ? 1160 : -500) : (show ? -500 : 1160)
//        }
//    }
//
//    private func getOffsetY() -> CGFloat {
//        switch selectedAlignment {
//        case "left":
//            return show ? 300 : -300
//        case "right":
//            return show ? -300 : 300
//        case "up", "down":
//            return 0 // Center vertically for up/down scrolling
//        default:
//            return 0
//        }
//    }

}
