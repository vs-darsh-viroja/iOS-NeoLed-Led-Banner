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
    
    static var arvoBoldFont = "Arvo-Bold"
    static var arvoItalicFont = "Arvo-Italic"
    static var arvoRegularFont = "Arvo-Regular"
    
    static var balsamiqSansBoldFont = "BalsamiqSans-Bold"
    static var balsamiqSansItalicFont = "BalsamiqSans-Italic"
    static var balsamiqSansRegularFont = "BalsamiqSans-Regular"
    
    static var dmSerifDisplayRegularFont = "DMSerifDisplay-Regular"
    static var dmSerifDisplayItalicFont = "DMSerifDisplay-Italic"

    static var dotoBoldFont = "Doto-Bold"
    static var dotoRegularFont = "Doto-Regular"
    
    static var dynaPuffBold = "DynaPuff-Bold"
    static var dynaPuffRegular = "DynaPuff-Regular"
    
    static var economicaBoldFont = "Economica-Bold"
    static var economicaItalicFont = "Economica-Italic"
    static var economicaRegularFont = "Economica-Regular"
    
    static var lobsterTwoBoldFont = "LobsterTwo-Bold"
    static var lobsterTwoItalicFont = "LobsterTwo-Italic"
    static var lobsterTwoRegularFont = "LobsterTwo-Regular"
    
    static var montserratBoldFont = "Montserrat-Bold"
    static var montserratItalicFont = "Montserrat-Italic"
    static var montserratRegularFont = "Montserrat-Regular"
    
    static var nunitoBoldFont = "Nunito-Bold"
    static var nunitoItalicFont = "Nunito-Italic"
    static var nunitoRegularFont = "Nunito-Regular"
    
    static var openSansBoldFont = "OpenSans-Bold"
    static var openSansItalicFont = "OpenSans-Italic"
    static var openSansRegularFont = "OpenSans-Regular"
    
    static var poppinsBoldFont = "Poppins-Bold"
    static var poppinsItalicFont = "Poppins-Italic"
    static var poppinsRegularFont = "Poppins-Regular"
    
    static var ralewayBoldFont = "Raleway-Bold"
    static var ralewayItalicFont = "Raleway-Italic"
    static var ralewayRegularFont = "Raleway-Regular"
    
    static var ribeyeRegularFont = "Ribeye-Regular"
    
    static var robotoBoldFont = "Roboto-Bold"
    static var robotoItalicFont = "Roboto-Italic"
    static var robotoRegularFont = "Roboto-Regular"
    
    static var zillaSlabBoldFont = "ZillaSlab-Bold"
    static var zillaSlabItalicFont = "ZillaSlab-Italic"
    static var zillaSlabRegularFont = "ZillaSlab-Regular"

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
     

    // MARK: - Arvo

    static func arvoBoldFont(size: CGFloat) -> Font {
        .custom(arvoBoldFont, size: size)
    }
    static func arvoItalicFont(size: CGFloat) -> Font {
        .custom(arvoItalicFont, size: size)
    }
    static func arvoRegularFont(size: CGFloat) -> Font {
        .custom(arvoRegularFont, size: size)
    }
     
    
    // MARK: - BalsamiqSans
    
    static func balsamiqSansBoldFont(size: CGFloat) -> Font {
        .custom(balsamiqSansBoldFont, size: size)
    }
    static func balsamiqSansItalicFont(size: CGFloat) -> Font {
        .custom(balsamiqSansItalicFont, size: size)
    }
    static func balsamiqSansRegularFont(size: CGFloat) -> Font {
        .custom(balsamiqSansRegularFont, size: size)
    }
    
    
    // MARK: - DMSerifDisplay
    
    static func dmSerifDisplayRegularFont(size: CGFloat) -> Font {
        .custom(dmSerifDisplayRegularFont, size: size)
    }
    static func dmSerifDisplayItalicFont(size: CGFloat) -> Font {
        .custom(dmSerifDisplayItalicFont, size: size)
    }

    // MARK: - Doto
    
    static func dotoBoldFont(size: CGFloat) -> Font {
        .custom(dotoBoldFont, size: size)
    }
    static func dotoRegularFont(size: CGFloat) -> Font {
        .custom(dotoRegularFont, size: size)
    }
   
    // MARK: - Economica
    
    static func economicaBoldFont(size: CGFloat) -> Font {
        .custom(economicaBoldFont, size: size)
    }
    static func economicaItalicFont(size: CGFloat) -> Font {
        .custom(economicaItalicFont, size: size)
    }
    static func economicaRegularFont(size: CGFloat) -> Font {
        .custom(economicaRegularFont, size: size)
    }
    
    
    // MARK: - LobsterTwo
    
    static func lobsterTwoBoldFont(size: CGFloat) -> Font {
        .custom(lobsterTwoBoldFont, size: size)
    }
    static func lobsterTwoItalicFont(size: CGFloat) -> Font {
        .custom(lobsterTwoItalicFont, size: size)
    }
    static func lobsterTwoRegularFont(size: CGFloat) -> Font {
        .custom(lobsterTwoRegularFont, size: size)
    }
    
    // MARK: - Montserrat
    
    static func montserratBoldFont(size: CGFloat) -> Font {
        .custom(montserratBoldFont, size: size)
    }
    static func montserratItalicFont(size: CGFloat) -> Font {
        .custom(montserratItalicFont, size: size)
    }
    static func montserratRegularFont(size: CGFloat) -> Font {
        .custom(montserratRegularFont, size: size)
    }
    
    // MARK: - Nunito
    
    static func nunitoBoldFont(size: CGFloat) -> Font {
        .custom(nunitoBoldFont, size: size)
    }
    static func nunitoItalicFont(size: CGFloat) -> Font {
        .custom(nunitoItalicFont, size: size)
    }
    static func nunitoRegularFont(size: CGFloat) -> Font {
        .custom(nunitoRegularFont, size: size)
    }
    
    // MARK: - OpenSans
    
    static func openSansBoldFont(size: CGFloat) -> Font {
        .custom(openSansBoldFont, size: size)
    }
    static func openSansItalicFont(size: CGFloat) -> Font {
        .custom(openSansItalicFont, size: size)
    }
    static func openSansRegularFont(size: CGFloat) -> Font {
        .custom(openSansRegularFont, size: size)
    }
    
    // MARK: - Poppins
    
    static func poppinsBoldFont(size: CGFloat) -> Font {
        .custom(poppinsBoldFont, size: size)
    }
    static func poppinsItalicFont(size: CGFloat) -> Font {
        .custom(poppinsItalicFont, size: size)
    }
    static func poppinsRegularFont(size: CGFloat) -> Font {
        .custom(poppinsRegularFont, size: size)
    }
    
    // MARK: - Raleway
    
    static func ralewayBoldFont(size: CGFloat) -> Font {
        .custom(ralewayBoldFont, size: size)
    }
    static func ralewayItalicFont(size: CGFloat) -> Font {
        .custom(ralewayItalicFont, size: size)
    }
    static func ralewayRegularFont(size: CGFloat) -> Font {
        .custom(ralewayRegularFont, size: size)
    }
    
    // MARK: - Ribeye
    
    static func ribeyeRegularFont(size: CGFloat) -> Font {
        .custom(ribeyeRegularFont, size: size)
    }
    
    // MARK: - Roboto
    
    static func robotoBoldFont(size: CGFloat) -> Font {
        .custom(robotoBoldFont, size: size)
    }
    static func robotoItalicFont(size: CGFloat) -> Font {
        .custom(robotoItalicFont, size: size)
    }
    static func robotoRegularFont(size: CGFloat) -> Font {
        .custom(robotoRegularFont, size: size)
    }
    
    // MARK: - ZillaSlab
    
    static func zillaSlabBoldFont(size: CGFloat) -> Font {
        .custom(zillaSlabBoldFont, size: size)
    }
    static func zillaSlabItalicFont(size: CGFloat) -> Font {
        .custom(zillaSlabItalicFont, size: size)
    }
    static func zillaSlabRegularFont(size: CGFloat) -> Font {
        .custom(zillaSlabRegularFont, size: size)
    }

    
    struct FontCapabilities {
         let hasBold: Bool
         let hasItalic: Bool
     }
     
     static func getFontCapabilities(for fontName: String) -> FontCapabilities {
         switch fontName {
         // Fonts with both bold and italic
         case bricolageGrotesqueRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: false)
         case arvoRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case balsamiqSansRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case lobsterTwoRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case montserratRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case nunitoRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case openSansRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case poppinsRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case ralewayRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case robotoRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case zillaSlabRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
         case economicaRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: true)
             
         // Fonts with only bold (no italic)
         case bricolageGrotesqueBoldFont:
             return FontCapabilities(hasBold: true, hasItalic: false)
         case dotoRegularFont:
             return FontCapabilities(hasBold: true, hasItalic: false)
         case dynaPuffRegular:
             return FontCapabilities(hasBold: true, hasItalic: false)
             
         // Fonts with only italic (no bold)
         case dmSerifDisplayRegularFont:
             return FontCapabilities(hasBold: false, hasItalic: true)
             
         // Fonts with neither bold nor italic
         case ribeyeRegularFont:
             return FontCapabilities(hasBold: false, hasItalic: false)
             
         default:
             // Default to supporting both if unknown
             return FontCapabilities(hasBold: true, hasItalic: true)
         }
     }
     
     // Helper method to check if an effect is available for a font
     static func isEffectAvailable(_ effectName: String, for fontName: String) -> Bool {
         let capabilities = getFontCapabilities(for: fontName)
         
         switch effectName {
         case "Bold":
             return capabilities.hasBold
         case "Italic":
             return capabilities.hasItalic
         default:
             return true // Other effects are always available
         }
     }
    
    
}

extension Text {
    func conditionalItalic(_ apply: Bool) -> Text {
        apply ? self.italic() : self
    }
}
