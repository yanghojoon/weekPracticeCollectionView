//
//  ImojiCollectionViewCell.swift
//  weekPracticeCollectionView
//
//  Created by 양호준 on 2022/01/08.
//

import UIKit

class ImojiCollectionViewCell: UICollectionViewCell {
    let imojiLabel: UILabel = { // UILabel 클래스 -> 구조체였다면 22~27이 실행되지 않을 것, view를 만들 때는 클로저로 만드는 게 좋다.
        let label = UILabel()
        label.textAlignment = .center
        return label
    }() // 소괄호를 열고 닫는 것은 클로저를 실행시킨 것. 리턴 값을 imojiLabel에 넣게 됨.
    
//    { return UILabel() } // () -> UILabel
    
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
//        imojiLabel.textAlignment = .center // 얘는 레이아웃이 아니니까 클로저에 넣거나 메서드 명 변경하면 좋을듯
    }
}
