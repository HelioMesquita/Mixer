//
//  FeedCellSwiftUIView.swift
//  Pokedex
//
//  Created by Hélio Mesquita on 27/05/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FeedCellSwiftUIView: View {
    
    @State var pokemon: Pokemon
    @State var backgroundColor = Color.clear
    
    var body: some View {
        HStack {
            VStack {
                WebImage(url: URL(string: pokemon.imageUrl))
                    .onSuccess { image, _, _ in
                        if let color = image.averageColor {
                            DispatchQueue.main.async {
                                backgroundColor = Color(color.withAlphaComponent(0.8))
                            }
                        }
                    }
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipped()
                Text(pokemon.name.capitalized)
                    .font(.title3)
            }
            .padding(.top, 5)
            .padding(.bottom, 5)

        }
        .frame(maxWidth: .infinity)
        .background(
            Color(backgroundColor)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
}

#Preview {
    FeedCellSwiftUIView(pokemon: Pokemon(name: "Pikachu", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/2.png"))
}
