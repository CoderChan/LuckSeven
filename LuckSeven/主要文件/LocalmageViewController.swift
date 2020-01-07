//
//  LocalmageViewController.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2019/12/22.
//  Copyright © 2019 LuckSeven. All rights reserved.
//

import UIKit
import YYKit
import KSPhotoBrowser


class LocalmageViewController: SuperViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var collectView: UICollectionView!
    
    var array: [LocalmageModel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "成员头像"
        self.view.backgroundColor = .red
        self.setupSubViews()
        self.addContrains()
        self.handleBuness()
    }

    override func setupSubViews() {
        
        let image: UIImage = (UIImage(named: "laugh")?.ks_imageByBlurDark())!
        let backView: UIImageView = UIImageView(image: image)
        backView.frame = self.view.bounds
        self.view.addSubview(backView)
        
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 44, width: self.view.width, height: 30))
        titleLabel.text = "参与的成员"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        self.view.addSubview(titleLabel)
        
        let backButton: UIButton = UIButton(type: .custom)
        backButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
        backButton.addBlock(for: .touchUpInside) { (sender) in
            self.navigationController?.popViewController(animated: true)
        }
        backButton.frame = CGRect(x: 30, y: titleLabel.top, width: titleLabel.height, height: titleLabel.height)
        self.view.addSubview(backButton)
        
        let space: CGFloat = LocalmageCollectionCell.space()
        let top: CGFloat = titleLabel.frame.maxY + 20
        
        self.array = LocalmageManager.localArray()
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = LocalmageCollectionCell.cellSize()
        flowLayout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        self.collectView = UICollectionView(frame: CGRect(x: -space, y: top, width: self.view.bounds.width + space * 2, height: self.view.bounds.height - top), collectionViewLayout: flowLayout)
        self.collectView?.delegate = (self as UICollectionViewDelegate)
        self.collectView?.dataSource = (self as UICollectionViewDataSource)
        self.collectView?.alwaysBounceVertical = true
        self.collectView?.register(LocalmageCollectionCell.self, forCellWithReuseIdentifier: "LocalmageCollectionCell")
        self.collectView.backgroundColor = .clear
        self.view.addSubview(self.collectView!)
        
    }
    
    override func addContrains() {
        
    }
    
    override func handleBuness() {
        
    }
    
}

extension LocalmageViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model: LocalmageModel = self.array[indexPath.item]
        let cell: LocalmageCollectionCell = LocalmageCollectionCell.sharedCell(collectionView, indexPath: indexPath)
        cell.imageNameStr = "\(model.index!).\(model.name!)"
        cell.name = model.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model: LocalmageModel = self.array[indexPath.item]
        let name: String = model.name
        let image: UIImage = UIImage(named: name)!
        let cell: LocalmageCollectionCell = collectionView.cellForItem(at: indexPath) as! LocalmageCollectionCell
        
        let item: KSPhotoItem = KSPhotoItem(sourceView: cell.coverImgView, image: image)
        let browser: KSPhotoBrowser = KSPhotoBrowser.init(photoItems: [item], selectedIndex: 0)
        browser.show(from: self)
    }
    
}
