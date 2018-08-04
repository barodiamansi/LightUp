//
//  ViewController.swift
//  LightUp
//
//  Created by Mansi Barodia on 8/4/18.
//  Copyright © 2018 Mansi Barodia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var flashLightButton: UIButton!
    @IBAction func flashLightMode(_ sender: UIButton) {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if ((device?.hasFlash)! && (device?.hasTorch)!) {
            do {
                try device?.lockForConfiguration()
                if (device?.torchMode == AVCaptureDevice.TorchMode.off) {
                    do {
                        try device?.setTorchModeOn(level: 1)
                    }
                    catch {
                        print("Cannot set the torch mode for the device")
                    }
                }
                else {
                    device?.torchMode = AVCaptureDevice.TorchMode.off
                }
                device?.unlockForConfiguration()
            }
            catch {
                print ("Device is missing flash and/or torch mode")
            }
        }
        else {
            let alert = UIAlertController(title: "Device not supported", message: "Your device does not have torch/flash.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

