//
//  ImojiCollectionViewCell.swift
//  weekPracticeCollectionView
//
//  Created by 양호준 on 2022/01/08.
//

import UIKit

class ImojiCollectionViewCell: UICollectionViewCell {
    let imojiLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(imojiLabel)
        setupLabelLayout()
    }
    
    private func setupLabelLayout() {
        imojiLabel.translatesAutoresizingMaskIntoConstraints = false
        imojiLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imojiLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imojiLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imojiLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imojiLabel.textAlignment = .center
    }
}
