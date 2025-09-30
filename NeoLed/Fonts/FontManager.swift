//
//  FontManager.swift
//  EveCraft
//
//  Created by Purvi Sancheti on 26/08/25.
//

import Foundation
import SwiftUI

struct FontManager {
    
    static var bricolageGrotesqueRegularFont = "BricolageGrotesque-Regular"
    static var bricolageGrotesqueMediumFont = "BricolageGrotesque-Medium"
    static var bricolageGrotesqueSemiBoldFont = "HanBricolageGrotesquekenGrotesk-SemiBold"
    static var bricolageGrotesqueBoldFont = "BricolageGrotesque-Bold"
    static var bricolageGrotesqueLightFont = "BricolageGrotesque-Light"
    static var bricolageGrotesqueExtraBold = "BricolageGrotesque-ExtraBold"
    
    static var audiowideRegular = "Audiowide-Regular"
    
    static var bakbakOneRegular = "BakbakOne-Regular"
    
    static var caesarDressingRegular = "CaesarDressing"
    
    static var battambangRegular = "Battambang-Regular"
    
    static var bradleyHandITCTTBold = "BradleyHandITCTT-Bold"
    
    static var brushScriptStd = "BrushScriptStd"
    
    
    // MARK: - BricolageGrotesque
    

    static func bricolageGrotesqueRegularFont(size: CGFloat) -> Font {
        .custom(bricolageGrotesqueRegularFont, size: size)
    }
    static func bricolageGrotesqueBoldFont(size: CGFloat) -> Font {
        .custom(bricolageGrotesqueBoldFont, size: size)
    }
    static func bricolageGrotesqueSemiBoldFont(size: CGFloat) -> Font {
        .custom(bricolageGrotesqueSemiBoldFont, size: size)
    }
    static func bricolageGrotesqueMediumFont(size: CGFloat) -> Font {
        .custom(bricolageGrotesqueMediumFont, size: size)
    }
    static func bricolageGrotesqueLightFont(size: CGFloat) -> Font {
        .custom(bricolageGrotesqueLightFont, size: size)
    }
    static func bricolageGrotesqueExtraBold(size: CGFloat) -> Font {
        .custom(bricolageGrotesqueExtraBold, size: size)
    }
     
    // MARK: - Audiowide
    
    static func audiowideRegular(size: CGFloat) -> Font {
        .custom(audiowideRegular, size: size)
    }
    
    // MARK: - BakbakOne
    
    static func bakbakOneRegular(size: CGFloat) -> Font {
        .custom(bakbakOneRegular, size: size)
    }

    // MARK: - Caesar Dressing
    
    static func caesarDressingRegular(size: CGFloat) -> Font {
        .custom(caesarDressingRegular, size: size)
    }
   
    // MARK: - Battambang
    
    static func battambangRegular(size: CGFloat) -> Font {
        .custom(battambangRegular, size: size)
    }

    
    // MARK: - Bradley Hand
    
    static func bradleyHandITCTTBold(size: CGFloat) -> Font {
        .custom(bradleyHandITCTTBold, size: size)
    }

    
    // MARK: - Brush Script Std
    
    static func brushScriptStd(size: CGFloat) -> Font {
        .custom(brushScriptStd, size: size)
    }

}
