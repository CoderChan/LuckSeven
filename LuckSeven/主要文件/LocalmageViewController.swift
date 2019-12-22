//
//  LocalmageViewController.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2019/12/22.
//  Copyright © 2019 LuckSeven. All rights reserved.
//

import UIKit

class LocalmageViewController: SuperViewController {
    
    var collectView: UICollectionView?
    var array: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "成员头像"
        self.setupSubViews()
        self.addContrains()
        self.handleBuness()
    }

    override func setupSubViews() {
        self.array = ["沈俊伟", "沈泳", "陈佳乔", "丁占占", "董俭俭", "葛天德", "郭委权", "何利庭", "蒋祥顺", "李飞欧", "李京龙", "李凌洪", "刘慧", "刘钰敏", "吕海斌", "倪璐佳", "钱啸林", "秦美玲", "盛苾慧", "唐成亮", "王懿丽", "吴爽", "杨玲", "易永耀", "俞雨阳", "张新", "赵彬栋", "郑林杰", "朱亦笑"]
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        self.collectView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        
    }
    
    override func addContrains() {
        
    }
    
    override func handleBuness() {
        
    }
    
}
