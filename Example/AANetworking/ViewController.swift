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
        test1()
    }
    
    open func test1() {
        
        ApiProvider.request(Api.moive("1764796"), type: Movie.self, completion: { response in
            
            let responseObject = response as! Movie
            print("Success...\(response)")
            print(responseObject)
            
        })
        
    }
    
    open func test2() {
        
        ApiProvider.request(.moive("1764796")) { (result) in
            
            switch result {
                
            case let .success(response):
                
                do {
                    
                    let success = try response
                        .mapArray(Person.self, path: "directors")
                    print("Success...\(success)")
                } catch {
                    print(error)
                }
            case let .failure(error):
                print("Error...\(error)")
            }
        }
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
