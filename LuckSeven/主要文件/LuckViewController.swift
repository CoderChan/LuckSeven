//
//  LuckViewController.swift
//  LuckSeven
//
//  Created by sks on 2020/1/2.
//  Copyright © 2020 LuckSeven. All rights reserved.
//

import UIKit

class LuckViewController: SuperViewController {
    
    var array: [LocalmageModel]!
    var luckView: YoungSphere!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.array = LocalmageManager.localArray()
        self.setupSubViews()
    }
    
    override func setupSubViews() {
        self.luckView = YoungSphere(frame: CGRect(x: 0, y: 64, width: self.view.width, height: self.view.width))
        var tempArray: [UIImageView] = NSMutableArray() as! [UIImageView]
        for (_, value) in self.array.enumerated() {
            let iconName: String = value.name
            let imgView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            imgView.image = UIImage(named: iconName)
            self.luckView.addSubview(imgView)
            tempArray.append(imgView)
        }
        self.luckView.setCloudTags(tempArray)
        self.view.addSubview(self.luckView)
    }
    
    override func handleBuness() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}
