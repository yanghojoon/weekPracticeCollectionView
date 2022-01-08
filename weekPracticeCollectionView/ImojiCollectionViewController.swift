//
//  ImojiCollectionViewController.swift
//  weekPracticeCollectionView
//
//  Created by 양호준 on 2022/01/08.
//

import UIKit



class ImojiCollectionViewController: UICollectionViewController {
    private let reuseIdentifier = "Cell"
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]
    let flowLayout = UICollectionViewFlowLayout() // 클래스이고 UICollectionViewLayout을 상속받고 있다. 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.collectionViewLayout = flowLayout
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return emojies.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath) as? ImojiCollectionViewCell else {
                return ImojiCollectionViewCell()
            }
        cell.imojiLabel.text = emojies[indexPath.item]
        cell.backgroundColor = .yellow
        return cell
    }

    // MARK: UICollectionViewDelegate

}

// MARK: UICollectionViewDelegateFlowLayout
extension ImojiCollectionViewController: UICollectionViewDelegateFlowLayout { // 동적인 상황에 대응하기 위함, 그게 아니라면 그냥 있는 flowlayout을 사용하는 것이 낫다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4 - 10

        return CGSize(width: width, height: width * 1.3)
    }
}
