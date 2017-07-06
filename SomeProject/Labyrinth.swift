//
//  Labyrinth.swift
//  SomeProject
//
//  Created by Максим Деханов on 25.06.17.
//  Copyright © 2017 Максим Деханов. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
import UIKit

class Labyrinth {
    var arrayOfWalls = [[Wall]]()
    var length = UIScreen.main.bounds.width
    var height: Int!
    var width: Int!
    
    init(n: Int, m: Int) {
        self.height = n
        self.width = m
        self.length = length / CGFloat(m)
        for i in 0..<n {
            var array: [Wall] = [Wall]()
            for j in 0..<m {
                let frame = CGRect(x: CGFloat(j) * length, y: CGFloat(i) * length + 30, width: length, height: length)
                if (i % 2 != 0 && j % 2 != 0) {
                    array.append(Wall(frame: frame, indexI: i, indexJ: j))
                } else {
                    array.append(Wall(frame: frame, indexI: i, indexJ: j))
                    array.last?.isWall = true
                    array.last?.visited = true
                }
            }
            arrayOfWalls.append(array)
        }
        generate()
    }
    
    private func generate() {
        var query = [Wall]()
        query.append(arrayOfWalls[1][1])
        while (checkToVisited()) {
            query.last?.visited = true
            if !query.isEmpty {
                if let Wall = self.getRandomNotVisitedNaibor(indexI: (query.last?.indexI)!, indexJ: (query.last?.indexJ)!) {
                    let minI: Int = (Wall.indexI < (query.last?.indexI)! ? Wall.indexI : query.last?.indexI)!
                    let minJ: Int = (Wall.indexJ < (query.last?.indexJ)! ? Wall.indexJ : query.last?.indexJ)!
                    let maxI: Int = (Wall.indexI > (query.last?.indexI)! ? Wall.indexI : query.last?.indexI)!
                    let maxJ: Int = (Wall.indexJ > (query.last?.indexJ)! ? Wall.indexJ : query.last?.indexJ)!
                    for i in minI...maxI {
                        for j in minJ...maxJ {
                            arrayOfWalls[i][j].isWall = false
                            arrayOfWalls[i][j].visited = true
                        }
                    }
                    query.append(Wall)
                } else {
                    query.remove(at: query.endIndex - 1)
                }
            } else {
                let notVisitedWall = arrayOfWalls.filter({ Walls -> Bool in
                    return !Walls.filter({$0.visited == false}).isEmpty
                }).first?.first
                if !(notVisitedWall?.visited)! {
                    query.append(notVisitedWall!)
                } else {
                    return
                }
            }
        }
    }
    
    private func checkToVisited() -> Bool {
        return self.arrayOfWalls.contains { Walls -> Bool in
            return Walls.contains(where: {$0.visited == false})
        }
    }
    
    private func getRandomNotVisitedNaibor(indexI: Int, indexJ: Int) -> Wall? {
        var notVisitedNaibors = [Wall]()
        if indexI + 2 < height {
            if !arrayOfWalls[indexI + 2][indexJ].visited {
                notVisitedNaibors.append(arrayOfWalls[indexI + 2][indexJ])
            }
        }
        if indexI - 2 > 0 {
            if !arrayOfWalls[indexI - 2][indexJ].visited {
                notVisitedNaibors.append(arrayOfWalls[indexI - 2][indexJ])
            }
        }
        if indexJ + 2 < width {
            if !arrayOfWalls[indexI][indexJ + 2].visited {
                notVisitedNaibors.append(arrayOfWalls[indexI][indexJ + 2])
            }
        }
        if indexJ - 2 > 0 {
            if !arrayOfWalls[indexI][indexJ - 2].visited {
                notVisitedNaibors.append(arrayOfWalls[indexI][indexJ - 2])
            }
        }
        if notVisitedNaibors.isEmpty {
            return nil
        }
        return notVisitedNaibors[Random.getRandomInt(length: notVisitedNaibors.count)]
    }
    
    func WallIsWall(indexI: Int, indexJ: Int) -> Bool {
        return arrayOfWalls[indexI][indexJ].isWall
    }
}
