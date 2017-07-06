//
//  Element.swift
//  SomeProject
//
//  Created by Максим Деханов on 25.06.17.
//  Copyright © 2017 Максим Деханов. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
import UIKit

class Element {
    var frame: CGRect!
    var indexI: Int!
    var indexJ: Int!
    
    init(frame: CGRect, indexI: Int, indexJ: Int) {
        self.frame = frame
        self.indexI = indexI
        self.indexJ = indexJ
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
