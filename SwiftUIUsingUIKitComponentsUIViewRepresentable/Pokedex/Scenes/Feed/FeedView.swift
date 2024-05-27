//
//  FeedView.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FeedView: View {

    @State var viewModel: FeedViewModelProtocol
    weak var coordinator: AppCoordinator?
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let height: CGFloat = 200
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach($viewModel.list) { pokemon in
                        FeedCellRepresentable(pokemon: pokemon)
                            .onAppear {
                                viewModel.handleNextPage(pokemon: pokemon.wrappedValue)
                            }
                            .onTapGesture {
                                coordinator?.showDetail(pokemon: pokemon.wrappedValue)
                            }
                            .frame(height: height)
                    }
                }
                .padding()
            }.onAppear {
                viewModel.loadPokemons()
            }
        }
    }
}
