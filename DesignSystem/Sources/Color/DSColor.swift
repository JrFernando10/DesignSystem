//
//  DSColor.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

public enum ColorEnum: String, CaseIterable, Codable {
    case bean1000 = "color-bean-1000"
    case bean900 = "color-bean-900"
    case bean800 = "color-bean-800"
    case bean700 = "color-bean-700"
    case bean600 = "color-bean-600"
    case bean500 = "color-bean-500"
    case bean400 = "color-bean-400"
    case bean300 = "color-bean-300"
    case bean200 = "color-bean-200"
    case bean100 = "color-bean-100"
    case bean50 = "color-bean-50"
    
    case blueViolet1000 = "color-blueViolet-1000"
    case blueViolet900 = "color-blueViolet-900"
    case blueViolet800 = "color-blueViolet-800"
    case blueViolet700 = "color-blueViolet-700"
    case blueViolet600 = "color-blueViolet-600"
    case blueViolet500 = "color-blueViolet-500"
    case blueViolet400 = "color-blueViolet-400"
    case blueViolet300 = "color-blueViolet-300"
    case blueViolet200 = "color-blueViolet-200"
    case blueViolet100 = "color-blueViolet-100"
    case blueViolet50 = "color-blueViolet-50"
    
    case bronze1000 = "color-bronze-1000"
    case bronze900 = "color-bronze-900"
    case bronze800 = "color-bronze-800"
    case bronze700 = "color-bronze-700"
    case bronze600 = "color-bronze-600"
    case bronze500 = "color-bronze-500"
    case bronze400 = "color-bronze-400"
    case bronze300 = "color-bronze-300"
    case bronze200 = "color-bronze-200"
    case bronze100 = "color-bronze-100"
    case bronze50 = "color-bronze-50"
    
    case cobalt1000 = "color-cobalt-1000"
    case cobalt900 = "color-cobalt-900"
    case cobalt800 = "color-cobalt-800"
    case cobalt700 = "color-cobalt-700"
    case cobalt600 = "color-cobalt-600"
    case cobalt500 = "color-cobalt-500"
    case cobalt400 = "color-cobalt-400"
    case cobalt300 = "color-cobalt-300"
    case cobalt200 = "color-cobalt-200"
    case cobalt100 = "color-cobalt-100"
    case cobalt50  = "color-cobalt-50"
    
    case mandy25   = "color-mandy-25"
    case mandy20   = "color-mandy-20"
    case mandy15   = "color-mandy-15"
    case mandy10   = "color-mandy-10"
    case mandy05   = "color-mandy-5"
    
    case forestGreen1000 = "color-forestGreen-1000"
    case forestGreen900 = "color-forestGreen-900"
    case forestGreen800 = "color-forestGreen-800"
    case forestGreen700 = "color-forestGreen-700"
    case forestGreen600 = "color-forestGreen-600"
    case forestGreen500 = "color-forestGreen-500"
    case forestGreen400 = "color-forestGreen-400"
    case forestGreen300 = "color-forestGreen-300"
    case forestGreen200 = "color-forestGreen-200"
    case forestGreen100 = "color-forestGreen-100"
    case forestGreen50 =  "color-forestGreen-50"
    
    case redRibbon15 = "color-redRibbon-15"
    case redRibbon10 = "color-redRibbon-10"
    case redRibbon5 = "color-redRibbon-5"
    
    case grey1000 = "color-grey-1000"
    case grey900 = "color-grey-900"
    case grey800 = "color-grey-800"
    case grey700 = "color-grey-700"
    case grey600 = "color-grey-600"
    case grey500 = "color-grey-500"
    case grey400 = "color-grey-400"
    case grey300 = "color-grey-300"
    case grey200 = "color-grey-200"
    case grey100 = "color-grey-100"
    case grey75 = "color-grey-75"
    case grey50 = "color-grey-50"
    case grey30 = "color-grey-30"
    case grey25 = "color-grey-25"
    case grey15 = "color-grey-15"
    case grey10 = "color-grey-10"
    case grey5 = "color-grey-5"
    
    case downRiver1000 = "color-downriver-1000"
    case downRiver900 =  "color-downriver-900"
    case downRiver800 =  "color-downriver-800"
    case downRiver700 =  "color-downriver-700"
    case downRiver600 =  "color-downriver-600"
    case downRiver500 =  "color-downriver-500"
    case downRiver400 =  "color-downriver-400"
    case downRiver300 =  "color-downriver-300"
    case downRiver200 =  "color-downriver-200"
    case downRiver100 =  "color-downriver-100"
    case downRiver75 =   "color-downriver-75"
    case downRiver50 =   "color-downriver-50"
    case downRiver30 =   "color-downriver-30"
    case downRiver25 =   "color-downriver-25"
    case downRiver15 =   "color-downriver-15"
    case downRiver10 =   "color-downriver-10"
    case downRiver5 =    "color-downriver-5"
    
    public func color() -> UIColor {
        return TokenManager.shared.getColorFor(name: ColorEnum(rawValue: self.rawValue) ?? .grey1000).color
    }
    
}

public class DSColor {
    private (set) var _hexString: String = "00FFFFFF"
    
    public var hexString: String {
        return toHex()
    }
    public var color: UIColor = .clear
    public var colorIdentifier: String = ""
    init() { }
    
    public init(colorHex: String, value: String, identifier: String) {
        _hexString = colorHex
        colorIdentifier = identifier
        color = UIColor(hexString: colorHex)
    }
    
    private func toHex() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"%06x", rgb)
    }
}
