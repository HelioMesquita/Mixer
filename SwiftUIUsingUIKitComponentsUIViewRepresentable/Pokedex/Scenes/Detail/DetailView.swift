//
//  DetailView.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import SwiftUI
import Charts
import SDWebImageSwiftUI

struct DetailView: View {
    
    @State var backgroundColor = Color.clear
    @State var viewModel: DetailViewModelProtocol
    weak var coordinator: AppCoordinator?
    let height: CGFloat = 100
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(backgroundColor)
                    Spacer()
                    WebImage(url: URL(string: viewModel.detailPokemon?.image ?? ""))
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
                        .padding(100)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                ZStack {
                    Rectangle()
                        .fill(backgroundColor)
                    HStack(spacing: 20) {
                        ForEach(viewModel.detailPokemon?.types ?? []) { type in
                            Text(type.name.capitalized)
                                .font(.title2)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.white, lineWidth: 4)
                                )
                        }
                    }
                }
                    .frame(height: 80)
                Rectangle()
                    .fill(backgroundColor)
                    .frame(height: 20)
            }
            VStack {
                Text("About")
                    .font(.title)
                    .padding(10)
                HStack(spacing: 30) {
                    VStack {
                        HStack {
                            Text("")
                                .font(.custom("FontAwesome6Free-Solid", size: 26))
                            Text(viewModel.detailPokemon?.getWeight ?? "")
                                .font(.title2)
                        }.padding(.bottom, 5)
                            .frame(height: height)
                        Text("Weight")
                            .font(.title3)
                    }
                    VStack {
                        HStack {
                            Text("📏")
                                .font(.custom("FontAwesome6Free-Solid", size: 26))
                            Text(viewModel.detailPokemon?.getHeight ?? "")
                                .font(.title2)
                        }.padding(.bottom, 5)
                            .frame(height: height)
                        Text("Height")
                            .font(.title3)
                    }
                    VStack {
                        VStack {
                            ForEach(viewModel.detailPokemon?.abilities ?? []) { ability in
                                Text(ability.name.capitalized)
                                    .font(.title2)
                            }
                        }
                        .frame(height: height)
                        Text("Moves")
                            .font(.title3)
                    }
                }
                Chart {
                    ForEach(viewModel.detailPokemon?.stats ?? []) { stats in
                        BarMark(
                            x: .value("Shape Type", stats.name.capitalized),
                            y: .value("Total Count", stats.base)
                        )
                        .foregroundStyle(backgroundColor)
                    }
                }
                .padding(20)
                .font(.title2)
            }
        }.onAppear {
            viewModel.loadDetail()
        }
    }
}

//#Preview {
//    DetailView()
//}

