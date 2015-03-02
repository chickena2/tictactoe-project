//
//  GameScene.swift
//  tictactoe
//
//  Created by khoa nguyen on 1/9/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import SpriteKit
import MultipeerConnectivity

class GameScene: SKScene
 {
    let mySquare = SKSpriteNode(imageNamed: "square")
    let button = SKSpriteNode(imageNamed: "square")
  
    
    let serviceType = "LCOC-Chat"
    
    var browser : MCBrowserViewController!
    var assistant : MCAdvertiserAssistant!
    var session : MCSession!
    var peerID: MCPeerID!
    /*
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let center = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        mySquare.position = center
        mySquare.name = "square"
        
        self.addChild(mySquare)
        
        button.position = CGPoint(x:center.x, y:center.y + 100)
        button.name = "button"
        self.addChild(button)
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.session = MCSession(peer: peerID)
        self.session.delegate = self
        
        // create the browser viewcontroller with a unique service name
        self.browser = MCBrowserViewController(serviceType:serviceType,
            session:self.session)
        
        self.browser.delegate = self;
        
        self.assistant = MCAdvertiserAssistant(serviceType:serviceType,
            discoveryInfo:nil, session:self.session)
        
        // tell the assistant to start advertising our fabulous chat
        self.assistant.start()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let nodes = self.nodesAtPoint(location)
            if (!nodes.isEmpty) {
                for node in nodes {
                    if (node.name == "square") {
                        mySquare.removeFromParent()
                        let squareX = SKSpriteNode(imageNamed: "squareX")
                        squareX.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
                        squareX.name = "squareX"
                        self.addChild(squareX)
                    }
                    
                /*
                else if (node.name != "square") {
                    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
                    myLabel.text = "Hello, World!";
                    myLabel.fontSize = 65;
                    myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
                    
                    self.addChild(myLabel)

                } */
                }
            }
        }
    }
    
    func browserViewControllerDidFinish(
        browserViewController: MCBrowserViewController!)  {
            // Called when the browser view controller is dismissed (ie the Done
            // button was tapped)
            
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(
        browserViewController: MCBrowserViewController!)  {
            // Called when the browser view controller is cancelled
            
            self.dismissViewControllerAnimated(true, completion: nil)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
*/
}
