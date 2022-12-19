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
    
    let sectionLeftRightPadding: CGFloat = 40
    let interItemSpacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        let headerNib = UINib(nibName: "CollectionHeaderFooterView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerFooter")
        
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "headerFooter")
        
        let insets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        //small item 1 of up row
        let smallItemUp1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
        let smallItemUp1 = NSCollectionLayoutItem(layoutSize: smallItemUp1Size)
        
        smallItemUp1.contentInsets = insets
        //small item 2 of up row
        let smallItemUp2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1))
        let smallItemUp2 = NSCollectionLayoutItem(layoutSize: smallItemUp2Size)
        
        smallItemUp2.contentInsets = insets
        //up layer
        let horiGroup1Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let horiGroup1 = NSCollectionLayoutGroup.horizontal(layoutSize: horiGroup1Size, subitems: [smallItemUp1, smallItemUp2])
        //small item of down row
        let smallItemDownSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
        let smallItemDown = NSCollectionLayoutItem(layoutSize: smallItemDownSize)
        
        smallItemDown.contentInsets = insets
        //down layer
        let horiGroup2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
        let horiGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: horiGroup2Size, subitems: [smallItemDown, smallItemDown, smallItemDown])
        
        //outer main group
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let outerGroup = NSCollectionLayoutGroup.vertical(layoutSize: outerGroupSize, subitems: [horiGroup1, horiGroup2])
        
        let section = NSCollectionLayoutSection(group: outerGroup)
        
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        
        collectionView.collectionViewLayout = compositionalLayout
        
        }
        
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let pet = pets[indexPath.row]
        cell.imgView.image = UIImage(named: pet.name)
        cell.label.text = String(pet.id)
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 200, height: 200)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: 200, height: 200)
//    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfCellsInSection: CGFloat = 3
        let availableWidth = (collectionView.bounds.width) - (sectionLeftRightPadding * 2) - (interItemSpacing * (numberOfCellsInSection - 1))
        
        let cellDimension = availableWidth/numberOfCellsInSection
        
        return CGSize(width: cellDimension, height: cellDimension)
        
        //return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: sectionLeftRightPadding, bottom: 10, right: sectionLeftRightPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
}





