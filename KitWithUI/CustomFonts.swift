//
//  CustomFonts.swift
//  KitWithUI
//
//  Created by Hélio Mesquita on 24/05/24.
//

import SwiftUI

extension View {

    func montSerratRegular(size: CGFloat) -> some View {
        self.font(.custom("Montserrat-Regular", size: size))
    }
    
    func montSerratBold(size: CGFloat) -> some View {
        self.font(.custom("Montserrat-Bold", size: size))
    }

    func fa(size: CGFloat) -> some View {
        self.font(.custom("FontAwesome", size: size))
    }
    
}
