//
//  GameScene.swift
//  ttt host 1
//
//  Created by khoa nguyen on 2/9/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import SpriteKit
import MultipeerConnectivity

class GameScene: SKScene, MCNearbyServiceAdvertiserDelegate,MCSessionDelegate {
    
    let serviceType = "ttt-host"
    var peerID: MCPeerID!
    var advertiser: MCNearbyServiceAdvertiser!
    var session : MCSession!
    
    override func didMoveToView(view: SKView) {
        
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.session = MCSession(peer: peerID)
        self.session.delegate = self
        self.advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        self.advertiser.delegate = self
        self.advertiser.startAdvertisingPeer()
        
    }
    
    // did receive invitation
    func advertiser(advertiser: MCNearbyServiceAdvertiser!,
        didReceiveInvitationFromPeer peerID: MCPeerID!,
        withContext context: NSData!,
        invitationHandler: ((Bool,
        MCSession!) -> Void)!)
    {
        invitationHandler(true, self.session)
        
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Arial")
        myLabel.text = peerID.displayName
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
       
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        //println(self.session.connectedPeers.count)
        /*
        for peer in self.session.connectedPeers {
            println(peer)
        }
        */
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
   
    func session(session: MCSession!, didReceiveData data: NSData!,
        fromPeer peerID: MCPeerID!)  {
            // Called when a peer sends an NSData to us
        
            var msg = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            println(msg)
    }
    
    // The following methods do nothing, but the MCSessionDelegate protocol
    // requires that we implement them.
    func session(session: MCSession!,
        didStartReceivingResourceWithName resourceName: String!,
        fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!)  {
            
            // Called when a peer starts sending a file to us
    }
    
    func session(session: MCSession!,
        didFinishReceivingResourceWithName resourceName: String!,
        fromPeer peerID: MCPeerID!,
        atURL localURL: NSURL!, withError error: NSError!)  {
            // Called when a file has finished transferring from another peer
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!,
        withName streamName: String!, fromPeer peerID: MCPeerID!)  {
            // Called when a peer establishes a stream with us
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!,
        didChangeState state: MCSessionState)  {
            // Called when a connected peer changes state (for example, goes offline)
            
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
