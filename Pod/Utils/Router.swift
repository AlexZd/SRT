//
//  Router.swift
//
//  Created by Alex Zdorovets on 6/17/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

class Router: NSObject {
    static let FTFlipAnimationDuration = 0.5
    static let sharedInstance = Router()
    
    var window : UIWindow
    
    //MARK: - FTRouter lifecycle
    
    override init() {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        super.init()
        self.showInitialViewController()
        self.window.makeKeyAndVisible()
    }
    
    //MARK: - Routing
    
    func showInitialViewController() {

    }
    
    //MARK: - Utils
    
    func setWindowRootViewController(viewController:UIViewController, completion: ((finished : Bool) -> Void)?) {
        viewController.view.frame = self.window.frame
        viewController.view.updateConstraints()
        let oldState = UIView.areAnimationsEnabled()
        if self.window.rootViewController == nil {
            UIView.setAnimationsEnabled(oldState)
            self.window.rootViewController = viewController
            completion?(finished: true)
        }else{
            UIView.transitionFromView(self.window.rootViewController!.view!, toView: viewController.view, duration: Router.FTFlipAnimationDuration, options: UIViewAnimationOptions.TransitionFlipFromLeft) { [unowned self] (finished) -> Void in
                UIView.setAnimationsEnabled(oldState)
                self.window.rootViewController = viewController
                completion?(finished: finished)
            }
        }
    }
}
