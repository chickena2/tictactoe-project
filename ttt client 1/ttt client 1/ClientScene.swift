//
//  ClientScene.swift
//  ttt client 1
//
//  Created by khoa nguyen on 2/16/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import SpriteKit
import MultipeerConnectivity

class ClientScene: SKScene, MCNearbyServiceBrowserDelegate {
    var mc : Multipeer!
    var buttonLabel : SKLabelNode!
    //var hostButton : SKSpriteNode!
    var browsingButton : SKButtonNode!
    var center:CGPoint!
    
    override func didMoveToView(view: SKView) {
        mc = Multipeer()
        //println(mc.browser.myPeerID.displayName)
        
        center = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        mc.browser.delegate = self
        
        displayDeviceName()
        
        browsingButton = SKButtonNode(imageNamed:"square")
        self.addChild(browsingButton)
        browsingButton.xScale = 3
        browsingButton.yScale = 0.5
        browsingButton.position = center
        
        browsingButton.setLabel("start browsing")

      
        //displayButton()
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
    /*
    func displayButton() {
        // dipsplay button
        browsingButton = SKSpriteNode(imageNamed:"square")
        browsingButton.xScale = 3
        browsingButton.yScale = 0.5
        browsingButton.position = center
        browsingButton.zPosition = -1
        self.addChild(browsingButton)
        
        // displaybutton label
        buttonLabel = SKLabelNode(fontNamed:"Arial")
        buttonLabel.text = "start browsing"
        buttonLabel.fontSize = 20
        buttonLabel.position.x = center.x
        buttonLabel.position.y = (center.y) - 5
        self.addChild(buttonLabel)
        
    }
    */
    // found peer
    func browser(browser: MCNearbyServiceBrowser!,
        foundPeer peerID: MCPeerID!,
        withDiscoveryInfo info: [NSObject : AnyObject]!)
    {
        println(peerID.displayName)
        let hostNameLabel = SKLabelNode(fontNamed: "Arial")
        hostNameLabel.text = ("found host : " + peerID.displayName)
        hostNameLabel.position.x = center.x
        hostNameLabel.position.y = (center.y) - 40
        hostNameLabel.fontSize  = 20
        self.addChild(hostNameLabel)
        /*
        browser.invitePeer(peerID, toSession:self.session, withContext: nil, timeout: 30)
        self.hostID = peerID
        let myLabel = SKLabelNode(fontNamed:"Arial")
        myLabel.text = peerID.displayName;
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
        */
    }
    
    func browser(browser: MCNearbyServiceBrowser!,
        lostPeer peerID: MCPeerID!)
    {
        
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let node = nodeAtPoint(location)
            if (node == browsingButton) || (node == buttonLabel) {
                //println("start hosting")
                buttonLabel.text = "browsing"
                mc.browser.startBrowsingForPeers()
            }
            
        }
    }
}