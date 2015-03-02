//
//  ViewController.swift
//  ttt1
//
//  Created by khoa nguyen on 1/19/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import UIKit
import MultipeerConnectivity
import SpriteKit

class ViewController: UIViewController,MCBrowserViewControllerDelegate {

    let serviceType = "LCOC-Chat"
    
    var browser : MCBrowserViewController!
    var assistant : MCAdvertiserAssistant!
    var session : MCSession!
    var peerID: MCPeerID!
    var connect: Bool = false
    var skView :SKView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if (connect) {
            let scene = GameScene(size: view.bounds.size)
            
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene)

        }
        else {
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.session = MCSession(peer: peerID)
        
        // create the browser viewcontroller with a unique service name
        self.browser = MCBrowserViewController(serviceType:serviceType,
            session:self.session)
        
        self.browser.delegate = self;
        
        self.assistant = MCAdvertiserAssistant(serviceType:serviceType,
            discoveryInfo:nil, session:self.session)
        
        // tell the assistant to start advertising our fabulous chat
        self.assistant.start()
        }
    }
    
    @IBAction func showBrowser(sender: UIButton) {
        // Show the browser view controller
        self.presentViewController(self.browser, animated: true, completion: nil)
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
            self.connect = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

