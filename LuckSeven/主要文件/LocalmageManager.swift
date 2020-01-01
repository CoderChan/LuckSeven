//
//  LocalmageManager.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2020/1/1.
//  Copyright © 2020 LuckSeven. All rights reserved.
//

import UIKit

class LocalmageManager: NSObject {
    static func localArray() -> [LocalmageModel] {
        let nameArr: [String] = ["沈俊伟", "沈泳", "陈佳乔", "丁占占", "董俭俭", "葛天德", "郭委权", "何利庭", "蒋祥顺", "李飞欧", "李京龙", "李凌洪", "刘慧", "刘钰敏", "吕海斌", "倪璐佳", "钱啸林", "秦美玲", "盛苾慧", "唐成亮", "王懿丽", "吴爽", "杨玲", "易永耀", "俞雨阳", "张新", "赵彬栋", "郑林杰", "朱亦笑","刘丹"]
        var tempArr: [LocalmageModel] = [LocalmageModel]()
        for (index, name) in nameArr.enumerated() {
            let model: LocalmageModel = LocalmageModel()
            model.index = index + 1
            model.name = name
            tempArr.append(model)
        }
        return tempArr
    }
}
