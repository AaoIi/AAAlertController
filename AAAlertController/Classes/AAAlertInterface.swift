//
//  AAAlertInterface.swift
//  AAAlertController
//
//  Created by AaoIi on 5/15/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit


class AAAlertInterface {

    func AAAlert(title:String?,message:String?,cancelButtonTitle:String,completionBlock: ()->(Void),animationStyle:animationType){

        let alertView = AAAlertController(nibName: "AAAlertController", bundle: NSBundle.mainBundle())
        alertView.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        alertView.AAAlertController(self.checkAndCleanNilValues(title), message: self.checkAndCleanNilValues(message), cancelButtonTitle: cancelButtonTitle,animationStyle:animationStyle, completionBlock:completionBlock)

        findAndReturnTopViewController().presentViewController(alertView, animated: true, completion: nil)
    
    }
    
    func AAAlert(title:String?,message:String?,okButtonTitle:String,okCompletionBlock: ()->(Void),cancelButtonTitle:String,cancelCompletionBlock: ()->(Void),animationStyle:animationType){
        
        let alertView = AAAlertController(nibName: "AAAlertController", bundle: NSBundle.mainBundle())
        alertView.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        alertView.AAAlertController(self.checkAndCleanNilValues(title), message: self.checkAndCleanNilValues(message), cancelButtonTitle: cancelButtonTitle, okButtonTitle: okButtonTitle,animationStyle:animationStyle, okCompletionBlock: okCompletionBlock, cancelCompletionBlock: cancelCompletionBlock)
        

        findAndReturnTopViewController().presentViewController(alertView, animated: true, completion: nil)
        
    }
    
    
    func AAAlert(title:String?,message:String?,firstButtonTitle:String,firstButtonCompletionBlock: ()->(Void),secondButtonTitle:String,secondButtonCompletionBlock: ()->(Void),cancelButtonTitle:String,cancelCompletionBlock: ()->(Void),animationStyle:animationType){
        
        let alertView = AAAlertController(nibName: "AAAlertController", bundle: NSBundle.mainBundle())
        alertView.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        alertView.AAAlertController(self.checkAndCleanNilValues(title), message: self.checkAndCleanNilValues(message), firstButtonTitle: firstButtonTitle, secondButtonTitle: secondButtonTitle, cancelButtonTitle: cancelButtonTitle, animationStyle: animationStyle, okCompletionBlock: firstButtonCompletionBlock, okCompletionBlock1: secondButtonCompletionBlock, cancelCompletionBlock: cancelCompletionBlock)
        
        
        findAndReturnTopViewController().presentViewController(alertView, animated: true, completion: nil)
        
    }


    private func checkAndCleanNilValues(string:String?) -> String{
        
        if string == nil {
            return ""
        }else{
            return string!
        }
        
    }
    
    private func findAndReturnTopViewController() -> UIViewController {
        
        if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        return UIViewController()
    }
    
    
}