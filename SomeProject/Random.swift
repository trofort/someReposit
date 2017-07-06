//
//  Random.swift
//  SomeProject
//
//  Created by Максим Деханов on 25.06.17.
//  Copyright © 2017 Максим Деханов. All rights reserved.
//

import Foundation

class Random {
    static func getRandomInt(length: Int) -> Int {
        return Int(arc4random_uniform(UInt32(length)))
    }
}
