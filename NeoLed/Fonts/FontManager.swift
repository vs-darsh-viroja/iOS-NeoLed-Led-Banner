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
}
