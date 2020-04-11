//
//  AlamofireExampleViewController.swift
//  AlamofireExample
//
//  Created by David Penagos on 10/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        requestAlamofire(url: "https://api.forecast.io/forecast/c19ba2cf80f2e4ebf2f29d4eebc4260a/37.7833,122.4167")
    }
    
    func requestAlamofire(url: String) {
        AF.request(url).responseJSON { (response) in
            print("Request: \(response.request!)")
            print("Response: \(response.response!)")
            print("Data: \(response.data!)")
            print("Result: \(response.result)")
            
            if let JSON = response.value {
                print("JSON: \(JSON)")
            }
        }
    }
}

