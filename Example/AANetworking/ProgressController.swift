//
//  ProgressController.swift
//  AANetworking_Example
//
//  Created by Muhammad Ahsan Ali on 08/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ProgressController: UIVisualEffectView {
    
    var title: String?
    var theme: UIBlurEffect.Style = .light
    
    let strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
    let activityIndicator = UIActivityIndicatorView()
    
    init(title: String, theme: UIBlurEffect.Style = .light) {
        super.init(effect: UIBlurEffect(style: theme))
        
        self.title = title
        self.theme = theme
        
        [activityIndicator, strLabel].forEach(contentView.addSubview(_:))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            frame = CGRect(x: superview.frame.midX - strLabel.frame.width / 2,
                           y: superview.frame.midY - strLabel.frame.height / 2, width: 220, height: 50)
            
            layer.cornerRadius = 15.0
            layer.masksToBounds = true
            
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
            activityIndicator.startAnimating()
            
            strLabel.text = title
            strLabel.numberOfLines = 0
            strLabel.font = .systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            strLabel.sizeToFit()
            
            switch theme {
            case .dark:
                strLabel.textColor = .white
                activityIndicator.style = .white
            default:
                strLabel.textColor = .gray
                activityIndicator.style = .gray
            }
        }
        
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
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
