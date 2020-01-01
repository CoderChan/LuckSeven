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
    
    var array: [String]!
    
    var space: CGFloat = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "成员头像"
        self.setupSubViews()
        self.addContrains()
        self.handleBuness()
    }

    override func setupSubViews() {
        
        let image: UIImage = (UIImage(named: "杨玲")?.ks_imageByBlurDark())!
        let backView: UIImageView = UIImageView(image: image)
        backView.frame = self.view.bounds
        self.view.addSubview(backView)
        
        self.array = LocalmageManager.localArray()
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = LocalmageCollectionCell.cellSize()
        flowLayout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        self.collectView = UICollectionView(frame: CGRect(x: -space, y: 0, width: self.view.bounds.width + space * 2, height: self.view.bounds.height - 64), collectionViewLayout: flowLayout)
        self.collectView?.delegate = (self as UICollectionViewDelegate)
        self.collectView?.dataSource = (self as UICollectionViewDataSource)
        self.collectView?.alwaysBounceVertical = true
        self.collectView?.register(LocalmageCollectionCell.self, forCellWithReuseIdentifier: "LocalmageCollectionCell")
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
        let cell: LocalmageCollectionCell = LocalmageCollectionCell.sharedCell(collectionView, indexPath: indexPath)
        cell.imageNameStr = self.array[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name: String = self.array[indexPath.item]
        let image: UIImage = UIImage(named: name)!
        let cell: LocalmageCollectionCell = collectionView.cellForItem(at: indexPath) as! LocalmageCollectionCell
        
        let item: KSPhotoItem = KSPhotoItem(sourceView: cell.coverImgView, image: image)
        let browser: KSPhotoBrowser = KSPhotoBrowser.init(photoItems: [item], selectedIndex: 0)
        browser.show(from: self)
    }
    
}
