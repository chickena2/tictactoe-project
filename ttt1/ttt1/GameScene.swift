//
//  GameScene.swift
//  ttt1
//
//  Created by khoa nguyen on 1/25/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // 1
    let player = SKSpriteNode(imageNamed: "square")
    
    override func didMoveToView(view: SKView) {
        // 2
        backgroundColor = SKColor.whiteColor()
        // 3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        addChild(player)
    }
}
