//
//  AAAlertInterface.swift
//  AAAlertController
//
//  Created by AaoIi on 5/15/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit


class AAAlertInterface {

    func AAAlert(_ title:String?,message:String?,cancelButtonTitle:String,completionBlock: @escaping ()->(Void),animationStyle:animationType){

        let alertView = AAAlertController(nibName: "AAAlertController", bundle: Bundle.main)
        alertView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.AAAlertController(self.checkAndCleanNilValues(title), message: self.checkAndCleanNilValues(message), cancelButtonTitle: cancelButtonTitle,animationStyle:animationStyle, completionBlock:completionBlock)

        findAndReturnTopViewController().present(alertView, animated: true, completion: nil)
    
    }
    
    func AAAlert(_ title:String?,message:String?,okButtonTitle:String,okCompletionBlock: @escaping ()->(Void),cancelButtonTitle:String,cancelCompletionBlock: @escaping ()->(Void),animationStyle:animationType){
        
        let alertView = AAAlertController(nibName: "AAAlertController", bundle: Bundle.main)
        alertView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        alertView.AAAlertController(self.checkAndCleanNilValues(title), message: self.checkAndCleanNilValues(message), cancelButtonTitle: cancelButtonTitle, okButtonTitle: okButtonTitle,animationStyle:animationStyle, okCompletionBlock: okCompletionBlock, cancelCompletionBlock: cancelCompletionBlock)
        

        findAndReturnTopViewController().present(alertView, animated: true, completion: nil)
        
    }
    
    
    func AAAlert(_ title:String?,message:String?,firstButtonTitle:String,firstButtonCompletionBlock: @escaping ()->(Void),secondButtonTitle:String,secondButtonCompletionBlock: @escaping ()->(Void),cancelButtonTitle:String,cancelCompletionBlock: @escaping ()->(Void),animationStyle:animationType){
        
        let alertView = AAAlertController(nibName: "AAAlertController", bundle: Bundle.main)
        alertView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        alertView.AAAlertController(self.checkAndCleanNilValues(title), message: self.checkAndCleanNilValues(message), firstButtonTitle: firstButtonTitle, secondButtonTitle: secondButtonTitle, cancelButtonTitle: cancelButtonTitle, animationStyle: animationStyle, okCompletionBlock: firstButtonCompletionBlock, okCompletionBlock1: secondButtonCompletionBlock, cancelCompletionBlock: cancelCompletionBlock)
        
        
        findAndReturnTopViewController().present(alertView, animated: true, completion: nil)
        
    }


    fileprivate func checkAndCleanNilValues(_ string:String?) -> String{
        
        if string == nil {
            return ""
        }else{
            return string!
        }
        
    }
    
    fileprivate func findAndReturnTopViewController() -> UIViewController {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        return UIViewController()
    }
    
    
}
