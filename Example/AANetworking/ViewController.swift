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
    
    let ApiProvider = AANetwork_Provider<Api>()

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
            print(responseObject.totalPages)
            print(responseObject)
        })
    }
    
    @IBAction func postRequestAction(_ sender: Any) {
        // TODO:-
    }
    
    // Codable
    @IBAction func postRequest2Action(_ sender: Any) {
        // TODO:-

    }
    
}

var progressController: ProgressController?
var viewController: ViewController!

func showProgressDialog(_ loadingMessage: String) {
    let progress = ProgressController(title: loadingMessage, theme: .dark)
    [progress].forEach(viewController.view.addSubview(_:))
    progressController = progress
}

func hideProgressDialog() {
    progressController?.hide()
}

func showProblem(_ message: String) {
    let alert = UIAlertController(title: "Something Went Wrong", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        
    }))
    viewController.present(alert, animated: true, completion: nil)
}
