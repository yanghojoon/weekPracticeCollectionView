//
//  ImojiCollectionViewController.swift
//  weekPracticeCollectionView
//
//  Created by 양호준 on 2022/01/08.
//

import UIKit



class ImojiCollectionViewController: UICollectionViewController {
    private let reuseIdentifier = "Cell"
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️", "🥎", "🎱", "🪀", "🤾🏻", "🎬"]
    let flowLayout = UICollectionViewFlowLayout() // 클래스이고 UICollectionViewDelegate을 상속받고 있다.
    // 시각적으로 보이는 것도 어떻게 보면 유저와의 상호작용이라고 볼 수 있다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        flowLayout.minimumLineSpacing = 20
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.isPagingEnabled = false // 트루로 하면 20의 간격만큼 스크롤이 밀리는 문제 발생
        collectionView.decelerationRate = .fast
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
// Therefore, implement this protocol on the object assigned to your collection view’s delegate property.
extension ImojiCollectionViewController: UICollectionViewDelegateFlowLayout { // 동적인 상황에 대응하기 위함, 그게 아니라면 그냥 있는 flowlayout을 사용하는 것이 낫다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width

        return CGSize(width: width, height: width * 1.3)
    }
}

// MARK: ScrollViewDelegate
extension ImojiCollectionViewController { // UICollectionViewDelegate가 UIScrollViewDelegate를 상속하고 있다. UICollectionViewDelegateFlowLayout이 UICollectionViewDelegate를 상속하고 있다.
    
    // 아래 메서드는 사용자가 스크롤을 하고 스크린과 손이 떨어졌을 때 호출되는 메서드이다.
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    }
}
