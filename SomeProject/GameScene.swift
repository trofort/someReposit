//
//  GameScene.swift
//  SomeProject
//
//  Created by Максим Деханов on 25.06.17.
//  Copyright © 2017 Максим Деханов. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var labyrinth: Labyrinth!
    
    
    override func sceneDidLoad() {
        self.backgroundColor = SKColor.white
        self.labyrinth = Labyrinth(n: 81, m: 51)
//        DrawManager.drawLabyrinth(labyrinth: labyrinth, superview: self)
        
    }
}
