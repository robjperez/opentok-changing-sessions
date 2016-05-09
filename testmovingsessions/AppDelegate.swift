//
//  AppDelegate.swift
//  testmovingsessions
//
//  Created by Roberto Perez Cubero on 09/05/16.
//  Copyright © 2016 tokbox. All rights reserved.
//

import UIKit
import OpenTok

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        OTAudioDeviceManager.setAudioDevice(OTDefaultAudioDeviceIOS271()) // -- 2.7.1 Audio Device -- Fails
        //OTAudioDeviceManager.setAudioDevice(OTDefaultAudioDeviceSAMPLES()) // -- Sample code Audio Device -- Works
        return true
    }

    func applicationWillResignActive(application: UIApplication) { }

    func applicationDidEnterBackground(application: UIApplication) { }

    func applicationWillEnterForeground(application: UIApplication) { }

    func applicationDidBecomeActive(application: UIApplication) { }

    func applicationWillTerminate(application: UIApplication) { }
}

