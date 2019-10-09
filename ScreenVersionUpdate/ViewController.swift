//
//  ViewController.swift
//  ScreenVersionUpdate
//
//  Created by 黃士軒 on 2019/10/9.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var versionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        versionLabel.text = getNowVersion()
        updateLaunchScreenAppVersion()
    }
    
    func getNowVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        
        return "Version：\(version)"
    }
    
    func updateLaunchScreenAppVersion() {
        guard let launchScreen = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController() else {return}
        self.view.addSubview(launchScreen.view)
        
        if let label = launchScreen.view.viewWithTag(1) as? UILabel {
            label.text = getNowVersion()
            UIView.animate(withDuration: 3,
                           delay: 1,
                           options: .curveEaseInOut,
                           animations: {
                            label.transform = CGAffineTransform(rotationAngle: .pi)
                            label.transform = .identity
                            launchScreen.view.alpha = 0
            }) { (finished) in
                launchScreen.view.removeFromSuperview()
            }
        }
    }
}


