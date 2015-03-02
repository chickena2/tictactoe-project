//
//  GameScene.swift
//  ttt client 1
//
//  Created by khoa nguyen on 2/9/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import SpriteKit
import MultipeerConnectivity

class GameScene: SKScene,MCNearbyServiceBrowserDelegate {
    let serviceType = "ttt-host"
    var peerID: MCPeerID!
    var mcBrowser:MCNearbyServiceBrowser!
    var session : MCSession!
    var hostID: MCPeerID!
    
    override func didMoveToView(view: SKView) {
        
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.session = MCSession(peer: peerID)
        mcBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        mcBrowser.delegate = self
        mcBrowser.startBrowsingForPeers()

    }
    
    // found peer
    func browser(browser: MCNearbyServiceBrowser!,
        foundPeer peerID: MCPeerID!,
        withDiscoveryInfo info: [NSObject : AnyObject]!)
    {
        browser.invitePeer(peerID, toSession:self.session, withContext: nil, timeout: 30)
        self.hostID = peerID
        let myLabel = SKLabelNode(fontNamed:"Arial")
        myLabel.text = peerID.displayName;
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
       
    }
    
    func browser(browser: MCNearbyServiceBrowser!,
        lostPeer peerID: MCPeerID!)
    {
        
    }

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        //println(self.session.connectedPeers.count)
        var text = "first message"
        var error : NSError?
        let msg = text.dataUsingEncoding(NSUTF8StringEncoding,
            allowLossyConversion: false)
        self.session.sendData(msg, toPeers: self.session.connectedPeers,
            withMode: MCSessionSendDataMode.Unreliable, error: &error)
        
        if error != nil {
            print("Error sending data: \(error?.localizedDescription)")
        }
        /*
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
        */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
