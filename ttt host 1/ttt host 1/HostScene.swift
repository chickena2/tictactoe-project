//
//  HostScene.swift
//  ttt host 1
//
//  Created by khoa nguyen on 2/13/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//


import SpriteKit
import MultipeerConnectivity

class HostScene: SKScene {
    
    var mc : Multipeer!
    var buttonLabel : SKLabelNode!
    var hostButton : SKSpriteNode!
    
    var center : CGPoint!
    
    override func didMoveToView(view: SKView) {
        mc = Multipeer()

        center = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        displayDeviceName()
        
        displayButton()
        
    }
    
    func displayDeviceName() {
        // display host name
        let deviceNameLabel = SKLabelNode(fontNamed:"Arial")
        deviceNameLabel.text = "client name : " + mc.peerID.displayName
        deviceNameLabel.fontSize  = 20
        deviceNameLabel.position.x = center.x
        deviceNameLabel.position.y = (center.y) + 20
        self.addChild(deviceNameLabel)
    }
    
    func displayButton() {
        // dipsplay button
        hostButton = SKSpriteNode(imageNamed:"square")
        hostButton.xScale = 3
        hostButton.yScale = 0.5
        hostButton.position = center
        hostButton.zPosition = -1
        self.addChild(hostButton)
        
        // displaybutton label
        buttonLabel = SKLabelNode(fontNamed:"Arial")
        buttonLabel.text = "start hosting"
        buttonLabel.fontSize = 20
        buttonLabel.position.x = center.x
        buttonLabel.position.y = (center.y) - 5
        self.addChild(buttonLabel)
    }

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let node = nodeAtPoint(location)
            if (node == hostButton) || (node == buttonLabel) {
                //println("start hosting")
                buttonLabel.text = "hosting"
                mc.advertiser.startAdvertisingPeer()
            }
            
        }
    }
}