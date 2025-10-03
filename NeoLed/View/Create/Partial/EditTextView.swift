//
//  EditTextView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 26/09/25.
//
 
import SwiftUI

struct Fonts {
   let fontName: String
}


struct Effect {
    let effectName: String
    let effectImage: String
}

struct TextAlignments {
    let alignmentName: String
    let alignmentImage: String
}

struct EditTextView: View {
       @Binding var selectedEffect: Set<String>
       @Binding var textSize: CGFloat
       @Binding var strokeSize: CGFloat
       @Binding var selectedFont: String
       @Binding var selectedColor: ColorOption
       @Binding var selectedOutlineColor: OutlineColorOption
       @Binding var outlineEnabled: Bool
       @Binding var hasCustomTextColor: Bool
       @Binding var customTextColor: UIColor
       @Binding var textSpeed: CGFloat
       @Binding var selectedAlignment: String
    
   var fontOptions: [Fonts] = [
       Fonts(fontName: FontManager.bricolageGrotesqueBoldFont),
       Fonts(fontName: FontManager.audiowideRegular),
       Fonts(fontName: FontManager.bakbakOneRegular),
       Fonts(fontName: FontManager.caesarDressingRegular),
       Fonts(fontName: FontManager.battambangRegular),
       Fonts(fontName: FontManager.bradleyHandITCTTBold),
       Fonts(fontName: FontManager.brushScriptStd),
   ]
   
    var effectOptions: [Effect] = [
        Effect(effectName: "None", effectImage: "noSelectionIcon"),
        Effect(effectName: "Bold", effectImage: "boldIcon"),
        Effect(effectName: "Italic", effectImage: "italicIcon"),
        Effect(effectName: "Glow", effectImage: "lightIcon"),
        Effect(effectName: "Blink", effectImage: "flashIcon"),
        Effect(effectName: "Mirror", effectImage: "mirrorIcon"),
    ]
    
    var alignmentOptions: [TextAlignments] = [
        TextAlignments(alignmentName: "None", alignmentImage: "noSelectionIcon"),
        TextAlignments(alignmentName: "left", alignmentImage: "leftArrowIcon"),
        TextAlignments(alignmentName: "right", alignmentImage: "rightArrowIcon"),
        TextAlignments(alignmentName: "up", alignmentImage: "upArrowIcon"),
        TextAlignments(alignmentName: "down", alignmentImage: "downArrowIcon"),

    ]

    
   // Color picker states
   @State private var showTextColorPicker = false
    
   @State private var showOutlineColorPicker = false

   @State private var customOutlineColor: UIColor = .blue
   @State private var hasCustomOutlineColor = false
    


    
   var body: some View {
       VStack(spacing: 0) {
           VStack(spacing: ScaleUtility.scaledSpacing(20)) {
               
               VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                   Text("Text Effect")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                       .kerning(0.40783)
                       .foregroundColor(.white.opacity(0.5))
                       .frame(maxWidth: .infinity,alignment: .leading)
                       .padding(.leading, ScaleUtility.scaledSpacing(30))
                   
                   ScrollView(.horizontal) {
                       
                       HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                           
                           ForEach(Array(effectOptions.enumerated()), id: \.offset) { _, effect in
                               
                               VStack(spacing: ScaleUtility.scaledSpacing(6)) {
                                   
                                   let isSelected = selectedEffect.contains(effect.effectName)
                                   
                                   Button {
                   
                                       // If "None" is clicked
                                       if effect.effectName == "None" {
                                           selectedEffect.removeAll()
                                           selectedEffect.insert("None")
                                       }
                                       // If any other effect is clicked
                                       else {
                                           // Remove "None" if it exists
                                           selectedEffect.remove("None")
                                           
                                           // Toggle the clicked effect
                                           if isSelected {
                                               selectedEffect.remove(effect.effectName)
                                               // If no effects remain, add "None" back
                                               if selectedEffect.isEmpty {
                                                   selectedEffect.insert("None")
                                               }
                                           } else {
                                               selectedEffect.insert(effect.effectName)
                                           }
                                       }
                                       
                                   } label: {
                                       
                                       Image(effect.effectImage)
                                           .resizable()
                                           .frame(width: effect.effectName == "Italic" 
                                                  ? ScaleUtility.scaledValue(6)
                                                  : ScaleUtility.scaledValue(16),
                                                  height: ScaleUtility.scaledValue(16))
                                           .padding(.all, ScaleUtility.scaledSpacing(13))
                                           .background {
                                               if isSelected {
                                                   EllipticalGradient(
                                                       stops: [
                                                           Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                                           Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                                       ],
                                                       center: UnitPoint(x: 0.36, y: 0.34)
                                                   )
                                               }
                                               else {
                                                   Color.black
                                               }
                                           }
                                           .cornerRadius(5)
                                           .overlay {
                                               RoundedRectangle(cornerRadius: 5)
                                                   .stroke( isSelected ? Color.accent : Color.clear, lineWidth: 1)
                                               
                                           }
                                   }
                                       
                                       Text(effect.effectName)
                                           .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(12)))
                                           .foregroundColor(Color.primaryApp)
                                   
                               }
                           }
                           
                           
                       }
                       .frame(alignment: .leading)
                       .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                   }
                   
               }
               
               
               VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                   Text("Font Style")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(14)))
                       .kerning(0.42)
                       .foregroundColor(.primaryApp.opacity(0.5))
                       .frame(maxWidth: .infinity, alignment: .topLeading)
                       .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                   
                   ScrollView(.horizontal) {
                       HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                           ForEach(Array(fontOptions.enumerated()), id: \.offset) { index, font in
                               Button(action: {
                                   selectedFont = font.fontName
                               }) {
                                   Text("Aa")
                                       .font(.custom(font.fontName, size: .scaledFontSize(14)))
                                       .foregroundColor(Color.primaryApp)
                                       .padding(ScaleUtility.scaledSpacing(12))
                                       .background {
                                           if selectedFont == font.fontName {
                                               EllipticalGradient(
                                                   stops: [
                                                       Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                                       Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                                   ],
                                                   center: UnitPoint(x: 0.36, y: 0.34)
                                               )
                                           }
                                           else {
                                               Color.clear
                                           }
                                       }
                                       .overlay {
                                           RoundedRectangle(cornerRadius: 8)
                                               .stroke(selectedFont == font.fontName ? Color.accent : Color.clear, lineWidth: 3)
                                       }
                                       .cornerRadius(8)
                               }
                           }
                       }
                       .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                   }
               }

               VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                   Text("Text Size")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(14)))
                       .kerning(0.42)
                       .foregroundColor(.primaryApp.opacity(0.5))
                       .frame(maxWidth: .infinity, alignment: .topLeading)
                   
                   HStack(spacing: ScaleUtility.scaledSpacing(17)) {
                       Text("A")
                           .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(10)))
                           .foregroundColor(.white)
                       
                       sizeCustomSlider(value: $textSize, range: 1.0...3.0)
                       
                       Text("A")
                           .font(FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(16)))
                           .foregroundColor(.white)
                   }
               }
               .padding(.horizontal, ScaleUtility.scaledSpacing(30))

               VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                   Text("Stroke Size")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(14)))
                       .kerning(0.42)
                       .foregroundColor(.primaryApp.opacity(0.5))
                       .frame(maxWidth: .infinity, alignment: .topLeading)
                   
                   HStack(spacing: ScaleUtility.scaledSpacing(17)) {
                       
                       StrokeText(text: "A",
                                 width: 0.5,
                                 color: Color.primaryApp,
                                  font: FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(16)),
                                 fontWeight: .regular) // Use .regular, .bold, .heavy, etc.
                       
                       
                       sizeCustomSlider(value: $strokeSize, range: 0...10)
                       
                       
                       StrokeText(text: "A",
                                  width: 1.0,
                                 color: Color.primaryApp,
                                  font: FontManager.bricolageGrotesqueRegularFont(size: .scaledFontSize(16)),
                                 fontWeight: .regular) // Use .regular, .bold, .heavy, etc.
                       

                   }
               }
               .padding(.horizontal, ScaleUtility.scaledSpacing(30))
          
      
               
               VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                   Text("Text Color")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                       .kerning(0.40783)
                       .foregroundColor(Color.primaryApp.opacity(0.5))
                       .frame(maxWidth: .infinity, alignment: .topLeading)
                       .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                   
                   ScrollView(.horizontal, showsIndicators: false) {
                       VStack(spacing: ScaleUtility.scaledSpacing(10)) {
                           // First Row - 10 colors
                           HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                               ForEach(0..<10) { index in
                                   colorButton(ColorOption.predefinedColors[index])
                                       .frame(height: ScaleUtility.scaledValue(30))
                               }
                           }
                           .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                           
                           // Second Row - 10 colors
                           HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                               ForEach(10..<20) { index in
                                   colorButton(ColorOption.predefinedColors[index])
                                       .frame(height: ScaleUtility.scaledValue(30))
                               }
                           }
                           .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                       }
                   }
               }
               
               ScrollView(.horizontal, showsIndicators: false) {
                   OutlineColorPickerView(
                       text: "Stroke Color",
                       selectedOutlineColor: $selectedOutlineColor,
                       showColorPicker: $showOutlineColorPicker,
                       hasCustomColor: $hasCustomOutlineColor,
                       customColor: $customOutlineColor,
                       outlineEnabled: $outlineEnabled
                   )
                   .padding(.horizontal, ScaleUtility.scaledSpacing(30))
               }
               
               
               VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                   Text("Text Speed")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                       .kerning(0.40783)
                       .foregroundColor(.white.opacity(0.5))
                       .frame(maxWidth: .infinity,alignment: .leading)
                       .padding(.leading, ScaleUtility.scaledSpacing(30))
                   
                   ReusableCustomSlider(value: $textSpeed, range: 0.5...5.0)
                     
              
               }
               
               
               VStack(spacing: ScaleUtility.scaledSpacing(15)) {
                   Text("Scroll Direction")
                       .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(13.5942)))
                       .kerning(0.40783)
                       .foregroundColor(Color.primaryApp.opacity(0.5))
                       .frame(maxWidth: .infinity, alignment: .topLeading)
                       .padding(.horizontal, ScaleUtility.scaledSpacing(30))
                   
                   ScrollView(.horizontal) {
                       
                       HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                           ForEach(Array(alignmentOptions.enumerated()), id: \.offset) { index, align in
                               
                               Button {
                                   DispatchQueue.main.async {
                                       selectedAlignment = ""
                                       selectedAlignment = align.alignmentName
                                   }
                               } label: {
                                   Image(align.alignmentImage)
                                       .resizable()
                                       .frame(width: ScaleUtility.scaledValue(16), height: ScaleUtility.scaledValue(16))
                                       .padding(.all, ScaleUtility.scaledSpacing(13))
                                       .background {
                                           if selectedAlignment == align.alignmentName {
                                               EllipticalGradient(
                                                stops: [
                                                    Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.4), location: 0.00),
                                                    Gradient.Stop(color: Color(red: 1, green: 0.87, blue: 0.03).opacity(0.2), location: 0.78),
                                                ],
                                                center: UnitPoint(x: 0.36, y: 0.34)
                                               )
                                           }
                                           else {
                                               Color.appGrey
                                           }
                                       }
                                       .cornerRadius(5)
                                       .overlay {
                                           RoundedRectangle(cornerRadius: 5)
                                               .stroke( selectedAlignment == align.alignmentName ? Color.accent : Color.clear, lineWidth: 1)
                                           
                                       }
                               }
                               
                               
                           }
                       }
                       
                       
                       
                   }
                   .frame(alignment: .leading)
                   .padding(.horizontal, ScaleUtility.scaledSpacing(30))
               }
          

           }
       }
       .sheet(isPresented: $showTextColorPicker) {
           ColorPickerSheet(
               uiColor: $customTextColor,
               isPresented: $showTextColorPicker,
               onColorApplied: { color in
                   customTextColor = color
                   selectedColor = ColorOption(
                       id: "custom_text",
                       name: "Custom",
                       type: .solid(Color(color))
                   )
                   hasCustomTextColor = true
               }
           )
           .presentationDetents(isIPad ? [.large, .fraction(0.95)] : [.fraction(0.9)])
       }
       .sheet(isPresented: $showOutlineColorPicker) {
           ColorPickerSheet(
               uiColor: $customOutlineColor,
               isPresented: $showOutlineColorPicker,
               onColorApplied: { color in
                   customOutlineColor = color
                   selectedOutlineColor = OutlineColorOption(
                       id: "custom_outline",
                       name: "Custom",
                       color: Color(color)
                   )
                   hasCustomOutlineColor = true
                   outlineEnabled = true
               }
           )
           .presentationDetents(isIPad ? [.large, .fraction(0.95)] : [.fraction(0.9)])
       }
   }
   
   @ViewBuilder
   private func colorButton(_ colorOption: ColorOption) -> some View {
       Button(action: {
           if colorOption.id == "white" {
               showTextColorPicker = true
           } else {
               selectedColor = colorOption
               hasCustomTextColor = false  // Deselect custom color
           }
       }) {
           ZStack {
               Rectangle()
                   .foregroundColor(.clear)
                   .frame(width: ScaleUtility.scaledValue(28), height: ScaleUtility.scaledValue(28))
                   .cornerRadius(5.83333)
                   .overlay {
                       RoundedRectangle(cornerRadius: 5)
                           .stroke(
                               (selectedColor.id == colorOption.id ||
                                (colorOption.id == "white" && hasCustomTextColor)) ?
                                   Color.accent : Color.clear,
                               lineWidth: 1
                           )
                   }
               
               // Show custom color in the white button if selected
               if colorOption.id == "white" && hasCustomTextColor {
                   Rectangle()
                       .fill(Color(customTextColor))
                       .frame(
                           width: ScaleUtility.scaledValue(22),
                           height: ScaleUtility.scaledValue(22)
                       )
                       .cornerRadius(5)
               } else {
                   colorOption.colorPreview(
                       size: (selectedColor.id == colorOption.id && !hasCustomTextColor) ?
                           ScaleUtility.scaledValue(22) : ScaleUtility.scaledValue(28)
                   )
                   .overlay {
                       if colorOption.id == "white" && !hasCustomTextColor {
                           Image(.plusIcon)
                               .resizable()
                               .frame(width: ScaleUtility.scaledValue(14), height: ScaleUtility.scaledValue(14))
                       }
                   }
               }
           }
       }
   }
}
