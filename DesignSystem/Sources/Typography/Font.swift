//
//  Font.swift
//  DesignSystem
//
//  Created by Fernando on 02/11/24.
//

import UIKit

public enum Font: String, CaseIterable {
    case nunitoBlack = "Nunito-Black"
    case nunitoBlackItalic = "Nunito-BlackItalic"
    case nunitoBold = "Nunito-Bold"
    case nunitoBoldItalic = "Nunito-BoldItalic"
    case nunitoExtraBold = "Nunito-ExtraBold"
    case nunitoExtraBoldItalic = "Nunito-ExtraBoldItalic"
    case nunitoExtraLight = "Nunito-ExtraLight"
    case nunitoExtraLightItalic = "Nunito-ExtraLightItalic"
    case nunitoItalic = "Nunito-Italic"
    case nunitoLight = "Nunito-Light"
    case nunitoLightItalic = "Nunito-LightItalic"
    case nunitoRegular = "Nunito-Regular"
    case nunitoSemiBold = "Nunito-SemiBold"
    case nunitoSemiBoldItalic = "Nunito-SemiBoldItalic"
    
    case muliRegular = "Muli-Regular"
    case muliBold = "Muli-Bold"
    case muliBoldItalic = "Muli-BoldItalic"
    case muliExtraLight = "Muli-ExtraLight"
    case muliExtraBold = "Muli-ExtraBold"
    case muliExtraLightItalic = "Muli-ExtraLightItalic"
    case muliItalic = "Muli-Italic"
    case muliLight = "Muli-Light"
    case muliLightItalic = "Muli-LightItalic"
    case muliSemiBold = "Muli-SemiBold"
    case muliSemiBoldItalic = "Muli-SemiBoldItalic"
    
    case sarabunBold = "Sarabun-Bold"
    case sarabunBoldItalic = "Sarabun-BoldItalic"
    case sarabunExtraBold = "Sarabun-ExtraBold"
    case sarabunExtraBoldItalic = "Sarabun-ExtraBoldItalic"
    case sarabunItalic = "Sarabun-Italic"
    case sarabunLight = "Sarabun-Light"
    case sarabunLightItalic = "Sarabun-LightItalic"
    case sarabunMedium = "Sarabun-Medium"
    case sarabunMediumItalic = "Sarabun-MediumItalic"
    case sarabunRegular = "Sarabun-Regular"

    func font(size: CGFloat) -> UIFont? {
        return UIFont(name: self.rawValue, size: size)
    }
}

extension Font {
    func font(size: CGFloat, withText text: String) -> (UIFont, String) {
        let font = self.font(size: size) ?? UIFont.systemFont(ofSize: size) 
        return (font, text)
    }
}
