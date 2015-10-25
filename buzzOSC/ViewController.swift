//
//  ViewController.swift
//  buzzOSC
//
//  Created by John Mars on 9/13/15.
//  Copyright © 2015 M4R5. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, F53OSCPacketDestination {
	
	var oscServer: F53OSCServer!
	
	func buzz() {
		AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
	}
	
	
	@IBAction func sendToMARS(sender: AnyObject) {
		
		let oscClient = F53OSCClient.init()
		oscClient.host = "192.168.1.100"
		oscClient.port = 3000
		
		sendMessage(oscClient, addressPattern: "/hello", arguments: [])
		buzz()
		
	}
	
	func takeMessage(message: F53OSCMessage!) {

		print("Received '\(message)'")
		buzz()
		
//		let addressPattern = message.addressPattern
//		let arguments = message.arguments
	}
	
	func sendMessage(client: F53OSCClient, addressPattern: String, arguments: [AnyObject]) {
		let message = F53OSCMessage(addressPattern: addressPattern, arguments: arguments)
		client.sendPacket(message)
		print("Sent '\(message)' to \(client.host):\(client.port)")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("Starting OSC Server")
		oscServer = F53OSCServer.init()
		oscServer.port = 3030
		oscServer.delegate = self
		if oscServer.startListening() {
			print("Listening for messages on port \(oscServer.port)")
		} else {
			print("Error: Server was unable to start listening on port \(oscServer.port)")
		}
		
	}

}

