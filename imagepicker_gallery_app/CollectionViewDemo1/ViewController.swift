//
//  ViewController.swift
//  CollectionViewDemo1
//
//  Created by Bjit on 9/12/22.
//

import UIKit
import PhotosUI
//Struct 1
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
//Struct 2
struct Pet2{
    let name: UIImage
    let id: Int
    
}
extension Pet2{
    static var pets2: [Pet2] = []
}
class ViewController: UIViewController {
    let pets = Pet.pets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var redTrans: UIButton!
    @IBOutlet weak var orangeTransition: UIButton!
    @IBOutlet weak var blueTransition: UIButton!
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
        //Appending images of struct 1 array to struct 2 array
        for pet in pets{
            Pet2.pets2.append(Pet2(name: UIImage(named: pet.name)!, id: pet.id))
        }
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
    func showImagePicker() {
        // the following condition checks if the selected source for media assets is avaialable or not
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary// picker will show assets from the photo library;
                // if you use .savedPhotosAlbum instead, picker will show images captured with the camera
            imagePicker.allowsEditing = true // enabling editing of selected photos; try changing the value from true to false and test the differences
            imagePicker.delegate = self
            present(imagePicker, animated: true)
        }
    }
    func showPHPicker() {
        var phPickerConfig = PHPickerConfiguration()
        phPickerConfig.selectionLimit = 10
        //phPickerConfig.filter = .all(of: [.images, .videos])
        phPickerConfig.filter = .images
        let phPicker = PHPickerViewController(configuration: phPickerConfig)
        phPicker.delegate = self
        present(phPicker, animated: true)
    }
    func saveImage(indexPath: IndexPath) {
        let fileManager = FileManager.default
        //URL for document directory
        guard let documentDirURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        // URl for subfoldser
        let folderURL = documentDirURL.appendingPathComponent("rootfolder")
            .appendingPathComponent("Images")
        print(folderURL.path)
        // Create subfolder Directory
        do {
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
        }
        catch {
            print(folderURL.path)
        }
        let currentDate = Date()
        let image = Pet2.pets2[indexPath.row].name
        let imageURL = folderURL.appendingPathComponent("image \(currentDate).png")
        // Convert Image to data
        let imageData = image.pngData()
        // Create/Save our text data in a newly created file
        try? imageData!.write(to: imageURL)
    }
    @IBAction func redBtnTapped(_ sender: Any) {
        redTrans.isUserInteractionEnabled = false
        orangeTransition.isUserInteractionEnabled = false
        collectionView.startInteractiveTransition(to: redBtnPage()) {
            [weak self] _, _ in
                guard let self = self else {
                        return
                        }
            self.redTrans.isUserInteractionEnabled = true
            self.orangeTransition.isUserInteractionEnabled = true
                }
                collectionView.finishInteractiveTransition()
    }
   @IBAction func orangeBtnTapped(_ sender: Any) {
       redTrans.isUserInteractionEnabled = false
       orangeTransition.isUserInteractionEnabled = false
        collectionView.startInteractiveTransition(to: orangeBtnPage()) {
            [weak self] _, _ in
                guard let self = self else {
                        return
                        }
            self.redTrans.isUserInteractionEnabled = true
            self.orangeTransition.isUserInteractionEnabled = true
                }
                collectionView.finishInteractiveTransition()
    }
    @IBAction func blueBtnTapped(_ sender: Any) {
        //showImagePicker()
        //showPHPicker()
        let alertAction = UIAlertController(title: "Alert", message: "Select One From Below", preferredStyle: .actionSheet)

        let showImagePickerAlert = UIAlertAction(title: "Show Image Picker", style: .default) { (action) in
            self.showImagePicker()
        }

        let phPickerAlert = UIAlertAction(title: "Show PHP Picker", style: .default) { (action) in
            self.showPHPicker()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertAction.addAction(showImagePickerAlert)
        alertAction.addAction(phPickerAlert)
        alertAction.addAction(cancel)
        present(alertAction, animated: true, completion: nil)
    }
        
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let actionSheet = UIAlertController(title: "Action Sheet", message: "Select One", preferredStyle: .actionSheet)
        let save = UIAlertAction(title: "Save Image", style: .default) { (action) in
           self.saveImage(indexPath: indexPath)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        actionSheet.addAction(save)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true, completion: nil)
    }
}
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Pet2.pets2.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = Pet2.pets2[indexPath.row].name
       return cell
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {

}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            Pet2.pets2.append(Pet2(name: originalImage, id: 0))
            collectionView.reloadData()
        }
        picker.dismiss(animated: true)
    }
}
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { [weak self] (image, error) in
                
                guard let self = self else { return }
                
                if let image = image as? UIImage {
                    Pet2.pets2.append(Pet2(name: image, id: 0))
                    DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    }

                }
                
            })
            
        }

    }
}





