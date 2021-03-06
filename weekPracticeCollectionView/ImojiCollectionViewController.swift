//
//  ImojiCollectionViewController.swift
//  weekPracticeCollectionView
//
//  Created by ์ํธ์ค on 2022/01/08.
//

import UIKit



class ImojiCollectionViewController: UICollectionViewController {
    private let reuseIdentifier = "Cell"
    let emojies = ["๐ฅ", "๐ฅฐ", "๐ฅฒ", "๐", "๐จโ๐ฌ", "๐คช", "๐ธ", "โพ๏ธ", "๐ฅ", "๐ฑ", "๐ช", "๐คพ๐ป", "๐ฌ"]
    let flowLayout = UICollectionViewFlowLayout() // ํด๋์ค์ด๊ณ  UICollectionViewDelegate์ ์์๋ฐ๊ณ  ์๋ค.
    // ์๊ฐ์ ์ผ๋ก ๋ณด์ด๋ ๊ฒ๋ ์ด๋ป๊ฒ ๋ณด๋ฉด ์ ์ ์์ ์ํธ์์ฉ์ด๋ผ๊ณ  ๋ณผ ์ ์๋ค.
    let minimumLineSpace = CGFloat(20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        flowLayout.minimumLineSpacing = 20
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.isPagingEnabled = true // ํธ๋ฃจ๋ก ํ๋ฉด 20์ ๊ฐ๊ฒฉ๋งํผ ์คํฌ๋กค์ด ๋ฐ๋ฆฌ๋ ๋ฌธ์  ๋ฐ์
        collectionView.decelerationRate = .fast
//        flowLayout.itemSize = CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>) // ๋ํดํธ๊ฐ์ 50, 50
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
// Therefore, implement this protocol on the object assigned to your collection viewโs delegate property.
extension ImojiCollectionViewController: UICollectionViewDelegateFlowLayout { // ๋์ ์ธ ์ํฉ์ ๋์ํ๊ธฐ ์ํจ, ๊ทธ๊ฒ ์๋๋ผ๋ฉด ๊ทธ๋ฅ ์๋ flowlayout์ ์ฌ์ฉํ๋ ๊ฒ์ด ๋ซ๋ค.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width
        let newWidth = UIScreen.main.bounds.width - minimumLineSpace

        return CGSize(width: newWidth, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: minimumLineSpace / 2, bottom: 0, right: minimumLineSpace)
    }
}

// MARK: ScrollViewDelegate
//extension ImojiCollectionViewController { // UICollectionViewDelegate๊ฐ UIScrollViewDelegate๋ฅผ ์์ํ๊ณ  ์๋ค. UICollectionViewDelegateFlowLayout์ด UICollectionViewDelegate๋ฅผ ์์ํ๊ณ  ์๋ค.
//
//    // ์๋ ๋ฉ์๋๋ ์ฌ์ฉ์๊ฐ ์คํฌ๋กค์ ํ๊ณ  ์คํฌ๋ฆฐ๊ณผ ์์ด ๋จ์ด์ก์ ๋ ํธ์ถ๋๋ ๋ฉ์๋์ด๋ค.
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//        // velocity๋ ๊ฐ์๋. ์ฒ์ฒํ ์์ง์ผ ์๋ ์๊ณ  ๋น ๋ฅด๊ฒ ์์ง์ผ ์๋ ์๋ค. (๋น ๋ฅผ ๋์๋ง ํ์ด์ง๋ฅผ ์ด๋ํ๋๋ก)
//        print(#function)
//        let cellIncludingSpace = collectionView.bounds.width + flowLayout.minimumLineSpacing
//        print(cellIncludingSpace)
//        targetContentOffset.pointee = CGPoint(x: cellIncludingSpace, y: 0)
//    }
//}
