//
//  AppFonts.swift
//
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI

// MARK: - AppFonts
public struct AppFonts {

    // MARK: Init
    public init() {
        #if os(watchOS)
        let customSize = 10.0 // Tamaño de ajuste para Apple Watch
        #else
        let customSize = 0.0 // Tamaño de ajuste para otros dispositivos
        #endif

        self.textXL = Font.system(size: 40 - customSize)
        self.textL = Font.system(size: 32 - customSize)
        self.textM = Font.system(size: 28 - customSize)
        self.textS = Font.system(size: 24 - customSize)
        self.textXS = Font.system(size: 16 - customSize)
        self.textXSS = Font.system(size: 8 - customSize)
    }

    // MARK: Properties
    public var textXL: Font
    public var textL: Font
    public var textM: Font
    public var textS: Font
    public var textXS: Font
    public var textXSS: Font
}
