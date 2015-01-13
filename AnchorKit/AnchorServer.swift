//
//  AnchorServer.swift
//  AnchorKit
//
//  Created by Moshe on 12/7/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import MultipeerConnectivity

class AnchorServer : NSObject, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate {
    
    //  ID Strings
    var serviceTypeID : NSString?
    var localPeerID : NSString?
    
    //  MultipeerConnectivity classes
    var advertiser : MCNearbyServiceAdvertiser?
    var session : MCSession?
    
    //  MARK: - Singleton Implementation
    
    class var SharedServer : AnchorServer {
        struct Static {
            static let instance : AnchorServer = AnchorServer()
        }
        return Static.instance
    }
    
    //  MARK: - Initializer
    
    override init() {
        
        super.init()
        
        serviceTypeID = "Anchor-debugService"
        localPeerID = NSString(format: "(Anchor Server) %@", UIDevice.currentDevice().name)
        
        let localPeerIdentifier :MCPeerID = MCPeerID(displayName: localPeerID!)
        
        if let serviceType = serviceTypeID {
            advertiser = MCNearbyServiceAdvertiser(peer: localPeerIdentifier, discoveryInfo: nil, serviceType: serviceType)
        }
        
        self.session = MCSession(peer: localPeerIdentifier)
        
        //  Wire up the delegates
        session?.delegate = self;
        advertiser?.delegate = self;
    }
    
    // MARK: - MCSessionDelegate
    
    // Remote peer changed state
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
    }
    
    // Received data from remote peer
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        
    }
    
    // Received a byte stream from remote peer
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
    }
    
    // Start receiving a resource from remote peer
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
    }
    
    // Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError  error: NSError!) {
        
    }
    
    //  MARK: - NSNearbyServiceAdvertiserDelegate
    
    // Incoming invitation request.  Call the invitationHandler block with YES and a valid session to connect the inviting peer to the session.
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
    }
    
    // Advertising did not start due to an error
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didNotStartAdvertisingPeer error: NSError!) {
        
    }
}