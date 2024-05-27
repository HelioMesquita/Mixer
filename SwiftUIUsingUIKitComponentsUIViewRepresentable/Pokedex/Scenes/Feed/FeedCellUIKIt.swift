//
//  FeedCellUIKIt.swift
//  Pokedex
//
//  Created by Hélio Mesquita on 27/05/24.
//

import Foundation
import UIKit
import SwiftUI

struct FeedCellRepresentable: UIViewRepresentable {
    
    typealias UIViewType = FeedCellUIKIt
    
    @Binding var pokemon: FeedModel.Pokemon
    
    func makeUIView(context: Context) -> FeedCellUIKIt {
        return FeedCellUIKIt(frame: .zero)
    }
    
    func updateUIView(_ uiView: FeedCellUIKIt, context: Context) {
        uiView.configure(pokemon: pokemon)
    }
    
}

class FeedCellUIKIt: UIView {
    
    lazy var pokedexImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(pokemon: FeedModel.Pokemon) {
        guard let url = URL(string: pokemon.imageURL) else { return }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.pokedexImage.image = image
                    if let averageColor = image.averageColor {
                        self.backgroundColor = averageColor.withAlphaComponent(0.8)
                    }
                }
            }
        }
        nameLabel.text = pokemon.name.capitalized
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(pokedexImage)
        addSubview(nameLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pokedexImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            pokedexImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokedexImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokedexImage.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    typealias UIViewType = UIView
    
    
}
