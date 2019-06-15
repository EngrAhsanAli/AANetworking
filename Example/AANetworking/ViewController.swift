//
//  ViewController.swift
//  AANetworking
//
//  Created by Ahsan Ali on 03/08/2019.
//  Copyright (c) 2019 Ahsan Ali. All rights reserved.
//

import UIKit
import AANetworking

class ViewController: UIViewController {
    
    let ApiProvider = AANetwork_Provider<Api>(plugins: [AANetwork_LoggerPlugin(verbose: true, responseDataFormatter: AAResponseJSONFormatter)])

    override func viewDidLoad() {
        super.viewDidLoad()
        viewController = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func getRequestAction(_ sender: Any) {
        ApiProvider.aa_request(Api.api2, completion: { (response) in
            print("Success...\(response)")
        })
    }
    

    // Codable
    @IBAction func getRequest2Action(_ sender: Any) {
        ApiProvider.aa_request(Api.api1, type: Model1.self, completion: { response in
            let responseObject = response as! Model1
            print("Success...\(response)")
            print(responseObject.totalPages ?? 0)
            print(responseObject)
        })
    }
    
    // Array Codeable
    @IBAction func getRequest3Action(_ sender: Any) {
        ApiProvider.aa_request(Api.api3, type: Model2.self, completion: { response in
            let responseObject = response as! [Model2]
            print("Success...\(response)")
            print(responseObject.count)
            print(responseObject)
        })
    }
    
    // String
    @IBAction func getRequest4Action(_ sender: Any) {
        ApiProvider.aa_request(Api.api4, completion: { response in
            print("Success...\(response)")
        })
    }
    
    // Post and String Path
    @IBAction func postRequestAction(_ sender: Any) {
        let params: [String : Any] = [
            "email": "eve.holt@reqres.in",
            "password": "cityslicka"
        ]
        ApiProvider.aa_request(Api.api5(params), completion: { response in
            print("Success...\(response)")
        })
    }
    
    // Codable
    @IBAction func postRequest2Action(_ sender: Any) {
        let model = Model3(email: "eve.holt@reqres.in", password: "cityslicka")
        ApiProvider.aa_request(Api.api6(model), completion: { response in
            print("Success...\(response)")
        })

    }
    
}
