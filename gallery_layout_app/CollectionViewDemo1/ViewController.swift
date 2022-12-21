//
//  ViewController.swift
//  CollectionViewDemo1
//
//  Created by Bjit on 9/12/22.
//

import UIKit

struct Pet {
    let name: String
    let id: Int
}

extension Pet {
    static let pets = [Pet(name: "cat", id: 1),
                       Pet(name: "dog", id: 2),
                       Pet(name: "hamster", id: 3),
                       Pet(name: "cat", id: 4),
                       Pet(name: "dog", id: 5),
                       Pet(name: "hamster", id: 6),
                       Pet(name: "cat", id: 7),
                       Pet(name: "dog", id: 8),
                       Pet(name: "hamster", id: 9),
                       Pet(name: "cat", id: 10),
                       Pet(name: "dog", id: 11),
                       Pet(name: "hamster", id: 12),
                       Pet(name: "cat", id: 13),
                       Pet(name: "dog", id: 14),
                       Pet(name: "hamster", id: 15),
                       Pet(name: "dog", id: 16),
                       Pet(name: "hamster", id: 17),
                       Pet(name: "cat", id: 18),
                       Pet(name: "dog", id: 19),
                       Pet(name: "hamster", id: 20),
                       Pet(name: "hamster", id: 21),
                       Pet(name: "hamster", id: 22)
                    ]
}


class ViewController: UIViewController {
    let pets = Pet.pets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var redTransition: UIButton!
    @IBOutlet weak var orangeTransition: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        let headerNib = UINib(nibName: "CollectionHeaderFooterView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerFooter")
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "headerFooter")
        collectionView.collectionViewLayout = redBtnPage()
        }
    func redBtnPage() -> UICollectionViewLayout{
        let insets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        let smallItemUp1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        let smallItemUp1 = NSCollectionLayoutItem(layoutSize: smallItemUp1Size)
        smallItemUp1.contentInsets = insets
        let horiGroup1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let horiGroup1 = NSCollectionLayoutGroup.horizontal(layoutSize: horiGroup1Size, subitems: [smallItemUp1, smallItemUp1])
        //outer main group
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/5))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [horiGroup1, horiGroup1])
        let section = NSCollectionLayoutSection(group: outerGroup)
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
        }
    func orangeBtnPage() -> UICollectionViewLayout{
        let insets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        let smallItemUp1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let smallItemUp1 = NSCollectionLayoutItem(layoutSize: smallItemUp1Size)
        smallItemUp1.contentInsets = insets
        //outer main group
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/4))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [smallItemUp1])
        let section = NSCollectionLayoutSection(group: outerGroup)
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
        }
    @IBAction func redBtnTapped(_ sender: Any) {
        redTransition.isUserInteractionEnabled = false
        orangeTransition.isUserInteractionEnabled = false
        collectionView.startInteractiveTransition(to: redBtnPage()) {
            [weak self] _, _ in
                guard let self = self else {
                        return
                        }
                    self.redTransition.isUserInteractionEnabled = true
                    self.orangeTransition.isUserInteractionEnabled = true
                }
                collectionView.finishInteractiveTransition()
    }
   @IBAction func orangeBtnTapped(_ sender: Any) {
        redTransition.isUserInteractionEnabled = false
        orangeTransition.isUserInteractionEnabled = false
        collectionView.startInteractiveTransition(to: orangeBtnPage()) {
            [weak self] _, _ in
                guard let self = self else {
                        return
                        }
                    self.redTransition.isUserInteractionEnabled = true
                    self.orangeTransition.isUserInteractionEnabled = true
                }
                collectionView.finishInteractiveTransition()
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let pet = pets[indexPath.row]
        cell.imgView.image = UIImage(named: pet.name)
       return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerFooter", for: indexPath) as! CollectionHeaderFooterView
            header.label.text = "section \(indexPath.section) header"
            header.bgView.backgroundColor = .systemIndigo
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerFooter", for: indexPath) as! CollectionHeaderFooterView
            footer.label.text = "section \(indexPath.section) footer"
            footer.bgView.backgroundColor = .systemRed
            return footer
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    
}





