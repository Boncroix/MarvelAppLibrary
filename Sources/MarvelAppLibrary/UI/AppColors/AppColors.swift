//
//  AppColors.swift
//
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI

// MARK: - AppColor
public struct AppColors {
    
    // MARK: Private Properties
    private var colorScheme: ColorScheme
    
    // MARK: Inits
    public init(colorScheme: ColorScheme = .light) {
        self.colorScheme = colorScheme
    }
    
    
    // MARK: Public Properties
    public var whiteBlack: Color {
        selectedSceneColor(lightColor: Color.white, darkColor: Color.black)
    }
    
    public var blackWhite: Color {
        selectedSceneColor(lightColor: Color.black, darkColor: Color.white)
    }
    
    public var orangeBlue: Color {
        selectedSceneColor(lightColor: Color.orange, darkColor: Color.blue)
    }
    
    public var blueOrange: Color {
        selectedSceneColor(lightColor: Color.blue, darkColor: Color.orange)
    }
    
    public var KCorange = Color(red: 243/255.0, green: 146/255.0, blue: 0/255.0)

    
    // MARK: Private Funtions
    private func selectedSceneColor(lightColor: Color, darkColor: Color) -> Color {
        switch colorScheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        default:
            return lightColor
        }
    }
}
