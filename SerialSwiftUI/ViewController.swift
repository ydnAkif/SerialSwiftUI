//
//  ViewController.swift
//  SerialSwiftUI
//
//  Created by Akif on 01.02.2023.
//  Copyright © 2023 Akif AYDIN. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {

    
    let portName = "/dev/cu.usbserial-110"
    var serialPort: SerialPort! = nil

    @IBOutlet weak var temp1: NSTextFieldCell!
    
    @IBOutlet weak var temp2: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        serialPort = SerialPort(path: portName)
        serialPort.setSettings(receiveRate: .baud9600, transmitRate: .baud9600, minimumBytesToRead: 1)

        do {
            try serialPort.openPort()
            
            let data1 = try serialPort.readLine()
            let data2 = try serialPort.readLine()

            temp1.stringValue = data1
            temp2.stringValue = data2
        } catch {
            print(error)
        }
        // Do any additional setup after loading the view.
        
    }
    


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {

    }

}

