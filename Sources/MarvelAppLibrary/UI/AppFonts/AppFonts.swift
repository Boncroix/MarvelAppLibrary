//
//  AppFonts.swift
//
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI

// MARK: - AppFonts
public struct AppFonts{

    // MARK: Init
    public init() {}
    
    // MARK: Properties
    public var textXL = Font.custom("SF PRO", size: 40)
    public var textXLBold = Font.custom("SF PRO", size: 40)
        .bold()
    
    public var textL = Font.custom("SF PRO", size: 32)
    public var textLBold = Font.custom("SF PRO", size: 32)
        .bold()
    
    public var textM = Font.custom("SF PRO", size: 28)
    public var textMBold = Font.custom("SF PRO", size: 28)
        .bold()
    
    public var textS = Font.custom("SF PRO", size: 24)
    public var textSBold = Font.custom("SF PRO", size: 24)
        .bold()
    
    public var textXS = Font.custom("SF PRO", size: 16)
    public var textXSBold = Font.custom("SF PRO", size: 16)
        .bold()
    
    public var textXSs = Font.custom("SF PRO", size: 8)
    public var textXSsBold = Font.custom("SF PRO", size: 8)
        .bold()
}
