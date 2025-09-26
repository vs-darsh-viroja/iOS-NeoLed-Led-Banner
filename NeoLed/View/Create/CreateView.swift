//
//  CreateView.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 24/09/25.
//

import Foundation
import SwiftUI

struct CreateView: View {
    @FocusState private var inputFocused: Bool
    @State var text: String = ""
    
    @State var selectedEditOption: String = "Text"
    var editOptions = ["Text",
                       "Effect",
                       "Background"]
    
    var body: some View {
        VStack(spacing:0) {
            
            VStack(spacing: ScaleUtility.scaledSpacing(23)) {
                
                TopView(text: $text, isInputFocused: $inputFocused)
                
                
                HStack(spacing: ScaleUtility.scaledSpacing(10)) {
                    ForEach(Array(editOptions.enumerated()), id: \.offset) { index, option in
                        Button {
                            selectedEditOption = option
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: ScaleUtility.scaledValue(102), height: ScaleUtility.scaledValue(34))
                                .foregroundColor(Color.clear)
                                .background {
                                    if selectedEditOption == option {
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
                                    Text(option)
                                        .font(FontManager.bricolageGrotesqueMediumFont(size: .scaledFontSize(14)))
                                        .kerning(0.42)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color.primaryApp)
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke( selectedEditOption == option ? Color.accent : Color.clear, lineWidth: 1)
                                    
                                }
                        }
                    }
                }
            }
            
            ScrollView {
                
                Spacer()
                    .frame(height: ScaleUtility.scaledValue(15))
                
                if selectedEditOption == "Effect" {
                    
                    EditTextView()
                }
                    
                  
            }
           
            
            
            
            Spacer()
        }
        .background {
            Image(.background)
                .resizable()
                .scaledToFill()
        }
    }
}
