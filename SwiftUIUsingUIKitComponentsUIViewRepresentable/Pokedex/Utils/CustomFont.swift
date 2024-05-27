//
//  view+extension.swift
//  pokedex
//
//  Created by Hélio Mesquita on 23/05/24.
//

import SwiftUI

extension View {

    func faBrands(size: CGFloat) -> some View {
        self.font(.custom("FontAwesome6Brands-Regular", size: size))
    }

    func faFreeRegular(size: CGFloat) -> some View {
        self.font(.custom("FontAwesome6Free-Regular-400", size: size))
    }
    
    func faFreeSolid(size: CGFloat) -> some View {
        self.font(.custom("FontAwesome6Free-Solid-900", size: size))
    }
}

