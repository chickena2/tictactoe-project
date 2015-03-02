//
//  Multipeer.swift
//  ttt host 1
//
//  Created by khoa nguyen on 2/13/15.
//  Copyright (c) 2015 knoob studio. All rights reserved.
//

import MultipeerConnectivity

class Multipeer {
    
    let serviceType = "ttt-host"
    
    var peerID: MCPeerID
    var session : MCSession
    var browser:MCNearbyServiceBrowser
    
    //var advertiser: MCNearbyServiceAdvertiser
    
    init() {
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.session = MCSession(peer: peerID)
        browser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        
        //self.advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
    }
    

}