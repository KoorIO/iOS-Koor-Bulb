//
//  ViewController.swift
//  iOS-Koor-Bulb
//
//  Created by Nguyen Sy Thanh Son on 3/3/17.
//  Copyright © 2017 Nguyen Sy Thanh Son. All rights reserved.
//

import UIKit

import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var _image_bulb: UIImageView!
    @IBOutlet weak var _switch_bulb: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func _switch_bulb_action(_ sender: Any) {
        
        
      

        if _image_bulb.image == UIImage(named: "bulbon") {
            _image_bulb.image = UIImage(named: "bulboff")
            _switch_bulb.setTitle("Turn On", for: .normal)
            sendMessage(s: "0")
        } else {
            _image_bulb.image = UIImage(named: "bulbon")
            _switch_bulb.setTitle("Turn Off", for: .normal)
            sendMessage(s: "1")
        }
    }
    
    func sendMessage(s: String) {
        let url = URL(string: "https://[Project_ID].koor.io/devices/[Device_ID]") // Please change it
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let postString = "message=" + s
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        }
        
        task.resume()
    }
}

