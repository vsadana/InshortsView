//
//  ViewController.swift
//  InShortView
//
//  Created by Vaibhav Sadana on 17/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let colors = [UIColor.red,UIColor.gray,UIColor.black]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "InShortCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "inShortCell")
        collectionView.collectionViewLayout = generateLayout()
    }

    func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let layoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [layoutItem]
        )

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPaging

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .horizontal
        config.contentInsetsReference = .none

        let layout = UICollectionViewCompositionalLayout(section: layoutSection, configuration: config)
        return layout
    }
}



extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inShortCell", for: indexPath) as! InShortCollectionViewCell
//        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
}
