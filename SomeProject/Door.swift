//
//  Door.swift
//  SomeProject
//
//  Created by Максим Деханов on 27.06.17.
//  Copyright © 2017 Максим Деханов. All rights reserved.
//

import Foundation
import SpriteKit

public enum DoorType: Int {
    case top = 0, bottom, left, right
}
class Door: SKShapeNode {
    var locked = true
    var toSection: Section!
    var fromSection: Section!
    var type: DoorType!
    
    init(type: DoorType) {
        super.init()
        let rect = CGRect(x: 0, y: 0, width: Device.width / 10.0, height: Device.width / 10.0)
        self.path = CGPath(rect: rect, transform: nil)
        self.type = type
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
