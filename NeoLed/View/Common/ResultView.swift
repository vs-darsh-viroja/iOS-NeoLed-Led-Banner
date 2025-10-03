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
    let selectedBgColor: OutlineColorOption
    let backgroundEnabled: Bool
    let outlineEnabled: Bool
    let hasCustomTextColor: Bool
    let customTextColor: UIColor

    let selectedEffects: Set<String>  // Keep this
    let selectedAlignment: String
    let selectedShape: String
    let textSpeed: CGFloat
    let isHD: Bool
    
    var isBold: Bool { selectedEffects.contains("Bold") }
    var isLight: Bool { selectedEffects.contains("Light") }
    var isFlash: Bool { selectedEffects.contains("Flash") }
    var isMirror: Bool { selectedEffects.contains("Mirror") }
    var onBack: () -> Void
   
    @State  var isFlashing = false
    
    @State var offsetx: CGFloat = 0
    @State var offsety: CGFloat = 0
    @State var textWidth: CGFloat = 0
    @State var show = false
    
    
    
    @State  var videoURL: URL? = nil
    @State  var showShareSheet: Bool = false
    @State  var showSaveAlert: Bool = false
    @State  var saveAlertMessage: String = ""
    @State  var isProcessing: Bool = false
    
    @State  var videoDuration: Double = 5.0
    @State  var frameRate: Int = 30
    
    var body: some View {
        ZStack(alignment: .top) {
            
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
                    if strokeSize > 0 {
                        StrokeText(
                            text: text,
                            width: strokeSize,
                            color: outlineEnabled ? selectedOutlineColor.color : .white,
                            font: .custom(selectedFont, size: textSize * 100),
                            fontWeight: isBold ? .heavy : (isLight ? .light : .regular)
                        )
                        .modifier(ColorModifier(colorOption: selectedColor))
                        .blur(radius: isLight ? 40 : 0)
                        .opacity(isLight ? 0.5 : 1)
                    } else {
                        Text(text)
                            .font(.custom(selectedFont, size: textSize * 100))
                            .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                            .modifier(ColorModifier(colorOption: selectedColor))
                            .blur(radius: isLight ? 40 : 0)
                            .opacity(isLight ? 0.5 : 1)
                    }
                    
                    if strokeSize > 0 {
                        StrokeText(
                            text: text,
                            width: strokeSize,
                            color: outlineEnabled ? selectedOutlineColor.color : .white,
                            font: .custom(selectedFont, size: textSize * 100),
                            fontWeight: isBold ? .heavy : (isLight ? .light : .regular)
                        )
                        .kerning(0.6)
                        .modifier(ColorModifier(colorOption: selectedColor))
                        .blur(radius: isLight ? 20 : 0)
                        .opacity(isLight ? 0.7 : 1)
                    } else {
                        Text(text)
                            .font(.custom(selectedFont, size: textSize * 100))
                            .kerning(0.4)
                            .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                            .modifier(ColorModifier(colorOption: selectedColor))
                            .blur(radius: isLight ? 20 : 0)
                            .opacity(isLight ? 0.7 : 1)
                    }
                    
                    // Sharp text on top
                    if strokeSize > 0 {
                        StrokeText(
                            text: text,
                            width: strokeSize,
                            color: outlineEnabled ? selectedOutlineColor.color : .white,
                            font: .custom(selectedFont, size: textSize * 100),
                            fontWeight: isBold ? .heavy : (isLight ? .light : .regular)
                        )
                        .modifier(ColorModifier(colorOption: selectedColor))
                        .brightness(0.1)
                        .opacity(isFlash && !isFlashing ? 0.3 : 1.0)
                    } else {
                        Text(text)
                            .font(.custom(selectedFont, size: textSize * 100))
                            .fontWeight(isBold ? .heavy : (isLight ? .light : .regular))
                            .modifier(ColorModifier(colorOption: selectedColor))
                            .brightness(0.1)
                            .opacity(isFlash && !isFlashing ? 0.3 : 1.0)
                    }
                }
                    .scaleEffect(x: isMirror ? -1 : 1, y: 1) // Mirror effect
                    .frame(height: 200)
                    .fixedSize()
                    .background { GeometryReader { textgeometry -> Color in
                        DispatchQueue.main.async {
                            self.textWidth = textgeometry.size.width
                        }
                        return Color.clear
                    }
                    }
                    .offset(x: getOffsetX(), y: getOffsetY())
                    .rotationEffect(.degrees(getRotation()))
                    .position(x: geo.size.width / 2)
                    .if(!isHD) { view in
                        view.mask {
                            getShapeImage()
                                .frame(width: geo.size.width, height: geo.size.height)
                        }
                    }
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                               switch selectedAlignment {
                               case "up":
                                   offsetx = geo.size.height + textWidth / 2
                               case "down":
                                   offsetx = -(geo.size.height + textWidth / 2)
                               case "left":
                                   offsety = geo.size.width + textWidth / 2
                               case "right":
                                   offsety = -(geo.size.width + textWidth / 2)
                               default:
                                   offsetx = isMirror ? -500 : 1160
                               }
                           }
                           
                           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                               let animationDuration = 10.0 / textSpeed
                               
                               withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                                   switch selectedAlignment {
                                   case "up":
                                       offsetx = -textWidth / 2
                                   case "down":
                                       offsetx = geo.size.height + textWidth / 2
                                   case "left":
                                       offsety = -textWidth / 2
                                   case "right":
                                       offsety = geo.size.width + textWidth / 2
                                   default:
                                       offsetx = isMirror ? 1160 : -500
                                   }
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
                
                // Replace your existing HStack with share and download buttons with this:

                HStack(spacing: ScaleUtility.scaledSpacing(14.57)) {
                    
                    // Share Video Button
                    Button {
                        if let url = videoURL {
                            showShareSheet = true
                        } else {
                            convertViewToVideo()
                        }
                    } label: {
                        if isProcessing {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .accent))
                                .frame(width: ScaleUtility.scaledValue(19.42857), height: ScaleUtility.scaledValue(19.42857))
                        } else {
                            Image(.shareIcon1)
                                .resizable()
                                .frame(width: ScaleUtility.scaledValue(19.42857), height: ScaleUtility.scaledValue(19.42857))
                        }
                    }
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
                            .stroke(Color.accent, lineWidth: 1)
                    }
                    .disabled(isProcessing)
                    
                    // Download Video Button
                    Button {
                        if let url = videoURL {
                            saveVideoToPhotos(url)
                        } else {
                            convertViewToVideo()
                        }
                    } label: {
                        if isProcessing {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .accent))
                                .frame(width: ScaleUtility.scaledValue(19.42857), height: ScaleUtility.scaledValue(19.42857))
                        } else {
                            Image(.downloadIcon)
                                .resizable()
                                .frame(width: ScaleUtility.scaledValue(19.42857), height: ScaleUtility.scaledValue(19.42857))
                        }
                    }
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
                            .stroke(Color.accent, lineWidth: 1)
                    }
                    .disabled(isProcessing)
                }
                .sheet(isPresented: $showShareSheet) {
                    if let url = videoURL {
                        ShareSheet(items: [url])
                    }
                }
                .alert("Video Status", isPresented: $showSaveAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(saveAlertMessage)
                }
            }
            .padding(.horizontal,ScaleUtility.scaledSpacing(28))
            .padding(.top,ScaleUtility.scaledSpacing(59))
            
        }
        .background {
            if backgroundEnabled {
                selectedBgColor.color
            }
            else {
                Color.secondaryApp
            }
           
        }
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
        .onAppear(){
            let animationDuration = 10.0 / textSpeed
            
            withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                show.toggle()
            }
        }
    }

    
    func saveVideoToPhotos(_ url: URL) {
        let videoSaver = VideoSaver()
        videoSaver.successHandler = {
            saveAlertMessage = "Video successfully saved to your photo library."
            showSaveAlert = true
        }
        videoSaver.errorHandler = { error in
            saveAlertMessage = "Error saving video: \(error.localizedDescription)"
            showSaveAlert = true
        }
        videoSaver.saveVideo(url)
    }
    
     func getShadowColor() -> Color {
        switch selectedColor.type {
        case .solid(let color):
            return color
        case .linearGradient(let gradientData):
            // Use the first color from the gradient for glow
            return gradientData.stops.first?.color ?? .white
        }
    }
    
    @ViewBuilder
     func getShapeImage() -> some View {
        switch selectedShape {
        case "circle":
            Image(.circle)
                .resizable().scaledToFill()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        case "square":
            Image(.square)
                .resizable().scaledToFill()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        case "heart":
            Image(.heart)
                .resizable().scaledToFill()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        case "star":
            Image(.star)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        case "ninjaStar":
            Image(.ninjaStar)
                .resizable().scaledToFill()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        default: // "None" or any other case
            Image(.circle)
                .resizable().scaledToFill()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
    
     func getOffsetX() -> CGFloat {
        switch selectedAlignment {
        case "up", "down":
            return offsetx
        case "left", "right":
            return 420 // Center horizontally for left/right scrolling
        default:
            return isMirror ? (show ? 1160 : -500) : (show ? -500 : 1160)
        }
    }

     func getOffsetY() -> CGFloat {
        switch selectedAlignment {
        case "left":
            return show ? 300 : -300
        case "right":
            return show ? -300 : 300
        case "up", "down":
            return 0 // Center vertically for up/down scrolling
        default:
            return 0
        }
    }

     func getRotation() -> Double {
        switch selectedAlignment {
        case "left":
            return -270
        case "right":
            return 90
        case "up":
            return -270
        case "down":
            return -270
        default: // "None" - use mirror logic
            return isMirror ? 90 : -270
        }
    }
}

  
