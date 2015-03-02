//
//  GameScene.swift
//  ttt1-1
//
//  Created by khoa nguyen on 1/26/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
let square = SKSpriteNode(imageNamed:"square")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        square.name = "square"
        square.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(square)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let touchedNode = self.nodeAtPoint(location)
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            self.square.runAction(SKAction.repeatActionForever(action))

            //NSLog(touchedNode.name! )
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
