//
//  FeedCell.swift
//  Pokedex
//
//  Created by Diggo Silva on 24/05/24.
//

import UIKit
import SDWebImage
import SwiftUI

class FeedCell: UICollectionViewCell {
    
    private var hostingController: UIHostingController<FeedCellSwiftUIView>?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(pokemon: Pokemon) {
        guard hostingController == nil else { return }
        let hostingController = UIHostingController(rootView: FeedCellSwiftUIView(pokemon: pokemon))
//        hostingController.sizingOptions = [.intrinsicContentSize]
        let swiftuiView = hostingController.view!
        swiftuiView.backgroundColor = .clear
        swiftuiView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(swiftuiView)
        NSLayoutConstraint.activate([
//            swiftuiView.widthAnchor.constraint(equalTo: widthAnchor),
//            swiftuiView.heightAnchor.constraint(equalTo: heightAnchor),
            swiftuiView.leadingAnchor.constraint(equalTo: leadingAnchor),
            swiftuiView.trailingAnchor.constraint(equalTo: trailingAnchor),
            swiftuiView.topAnchor.constraint(equalTo: topAnchor),
            swiftuiView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        self.hostingController = hostingController
    }
    
    
    private func setupView() {
        
    }
}
