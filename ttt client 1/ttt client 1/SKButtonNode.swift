//
//  Button.swift
//  ttt client 1
//
//  Created by khoa nguyen on 2/24/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import SpriteKit

class SKButtonNode : SKSpriteNode {
    var label : SKLabelNode?
    
    func setLabel(text : String) {
        if (label == nil) {
            label = SKLabelNode(fontNamed: "Arial")
        }
        label?.text = text
        label?.position.x = self.position.x
        label?.position.y = (self.position.y)-5
        label?.fontSize = 20
        println(label?.text)
        if self.scene == nil {
            println("button does not add to scene yet")
        } else {
            self.scene?.addChild(label!)
        }
        
        
    }
    
}

