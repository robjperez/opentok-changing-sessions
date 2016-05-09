//
//  ViewController.swift
//  testmovingsessions
//
//  Created by Roberto Perez Cubero on 09/05/16.
//  Copyright © 2016 tokbox. All rights reserved.
//

import UIKit
import OpenTok

class ViewController: UIViewController {
    var sessions = ["SESSION1", "SESSION2", "SESSION3"]
    var apiKey = "APIKEY1"
    var tokens = ["TOKEN1", "TOKEN2", "TOKEN3"]
    
    var idx = 0
    var session: OTSession?
    
    var publisher : OTPublisher!
    let logger = OTLogger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPublisher()
        connectToSession()
        
        NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    
    func createPublisher() {
        publisher = OTPublisher(delegate: self)
        publisher.view.frame = CGRect(x: 0, y: 0, width: 320, height: 240)
        view.addSubview(publisher.view)
    }
    
    func destroyPublisher() {
        publisher.view.removeFromSuperview()
        publisher = nil
    }
    
    func timerFired() {
        print("Timer fired")
        
        session?.unpublish(publisher, error: nil)
    }
    
    func connectToSession() {
        let sid = sessions[idx]
        let token = tokens[idx]
        
        print("Connecting to session: \(sid) \(token)")
        session = OTSession(apiKey: apiKey, sessionId: sid, delegate: self)
        session?.connectWithToken(token, error: nil)
    }
}

extension ViewController: OTSessionDelegate {
    func sessionDidConnect(session: OTSession!) {
        print("Session Connected with id: \(session.connection.connectionId) - \(self.session?.connection.connectionId)")
        
        session.publish(publisher, error: nil)
    }
    
    func sessionDidDisconnect(session: OTSession!) {
        print("Session disconnect")
        idx = (idx + 1) % sessions.count
        
        //createPublisher() -- UNCOMMENT THIS TO RECREATE PUBLISHER
        connectToSession()
    }
    
    func session(session: OTSession!, didFailWithError error: OTError!) {
    }
    
    func session(session: OTSession!, streamCreated stream: OTStream!) {
    }
    
    func session(session: OTSession!, streamDestroyed stream: OTStream!) {
    }
}

extension ViewController: OTPublisherDelegate {
    func publisher(publisher: OTPublisherKit!, streamCreated stream: OTStream!) {
        print("Publishing!")
    }
    
    func publisher(publisher: OTPublisherKit!, streamDestroyed stream: OTStream!) {
        print("Stream Destroyed")
        
        //destroyPublisher() -- UNCOMMENT THIS TO RECREATE PUBLISHER
        session?.disconnect(nil)
    }
    
    func publisher(publisher: OTPublisherKit!, didFailWithError error: OTError!) {
    }
}

