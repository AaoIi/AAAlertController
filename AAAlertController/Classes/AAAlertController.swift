//
//  AAAlertController.swift
//  AAAlertController
//
//  Created by AaoIi on 4/13/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit


public enum animationType {
    case `default`
    case shake
    case slideDown
    case slideUp
    case slideRight
    case slideLeft
    case fade
}

class AAAlertController: UIViewController {
    
    //* create alert with one cancel button
    @IBOutlet var viewOneButton: UIView!
    @IBOutlet var viewOneHeight: NSLayoutConstraint!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleLabelHeight: NSLayoutConstraint!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var cancelButton: UIButton!
    
    //* create alert with cancel and action button
    @IBOutlet var viewWithTwoButtons: UIView!
    @IBOutlet var viewTwoHeight: NSLayoutConstraint!
    @IBOutlet var titleLabel2: UILabel!
    @IBOutlet var titleLabel2Height: NSLayoutConstraint!
    @IBOutlet var messageLabel2: UILabel!
    @IBOutlet var cancelButton2: UIButton!
    @IBOutlet var okButton: UIButton!
    
    @IBOutlet var viewWithThreeButtons: UIView!
    @IBOutlet var viewThreeHeight: NSLayoutConstraint!
    @IBOutlet var titleLabel3: UILabel!
    @IBOutlet var titleLabel3Height: NSLayoutConstraint!
    @IBOutlet var messageLabel3: UILabel!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var cancelButton3: UIButton!
    
    
    //* local variables
    fileprivate var titleText : String?
    fileprivate var messageText : String?
    fileprivate var cancelButtonTitle : String?
    fileprivate var okButtonTitle : String?
    // ok button title 1 is used for three button view (second button)
    fileprivate var okButtonTitle1 : String?
    fileprivate var oneViewFlag = false
    fileprivate var twoViewFlag = false
    fileprivate var threeViewFlag = false
    fileprivate var okCompletionBlock : () -> (Void) = {}
    // ok completion block 1 is used for three button view (second button)
    fileprivate var okCompletionBlock1 : () -> (Void) = {}
    fileprivate var cancelCompletionBlock : () -> (Void) = {}
    fileprivate var animationStyle : animationType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if oneViewFlag == true {
            
            //* setup for alert with cancel button
            self.viewWithTwoButtons.isHidden = true
            self.viewOneButton.isHidden = false
            self.viewWithThreeButtons.isHidden = true
            
            self.titleLabel.text = titleText
            self.messageLabel.text = messageText
            self.cancelButton.setTitle(cancelButtonTitle, for: UIControlState())
            self.cancelButton.addTarget(self, action: #selector(self.cancelAAAlertController(_:)), for: UIControlEvents.touchUpInside)
            
            caclulateAlertHeight(viewOneHeight, view: viewOneButton, messageLabel: messageLabel, titleHeightConstraint: titleLabelHeight, titleLabel: titleLabel)
            
        }else if twoViewFlag == true{
            
            //* setup for alert with action and cancel button
            self.viewWithTwoButtons.isHidden = false
            self.viewOneButton.isHidden = true
            self.viewWithThreeButtons.isHidden = true
            
            self.titleLabel2.text = titleText
            self.messageLabel2.text = messageText
            
            self.cancelButton2.setTitle(cancelButtonTitle, for: UIControlState())
            self.cancelButton2.addTarget(self, action: #selector(self.cancelAAAlertController(_:)), for: UIControlEvents.touchUpInside)
            
            self.okButton.setTitle(okButtonTitle, for: UIControlState())
            self.okButton.addTarget(self, action: #selector(self.okAAAlertController(_:)), for: UIControlEvents.touchUpInside)
            
            caclulateAlertHeight(viewTwoHeight, view: viewWithTwoButtons, messageLabel: messageLabel2, titleHeightConstraint: titleLabel2Height, titleLabel: titleLabel2)

        }else {
        
            //* Setup for alert with two buttons and cancel button
            self.viewWithTwoButtons.isHidden = true
            self.viewOneButton.isHidden = true
            self.viewWithThreeButtons.isHidden = false
        
            self.titleLabel3.text = titleText
            self.messageLabel3.text = messageText
            
            self.cancelButton3.setTitle(cancelButtonTitle, for: UIControlState())
            self.cancelButton3.addTarget(self, action: #selector(self.cancelAAAlertController(_:)), for: UIControlEvents.touchUpInside)
            
            self.firstButton.setTitle(okButtonTitle, for: UIControlState())
            self.firstButton.addTarget(self, action: #selector(self.okAAAlertController(_:)), for: UIControlEvents.touchUpInside)
            
            self.secondButton.setTitle(okButtonTitle1, for: UIControlState())
            self.secondButton.addTarget(self, action: #selector(self.okAAAlertController1(_:)), for: UIControlEvents.touchUpInside)
            
            caclulateAlertHeight(viewThreeHeight, view: viewWithThreeButtons, messageLabel: messageLabel, titleHeightConstraint: titleLabel3Height, titleLabel: titleLabel3)
        
        }
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if oneViewFlag == true {
            
            self.makeAnimationForView(viewOneButton)
            
        }else if twoViewFlag == true{
            
            self.makeAnimationForView(viewWithTwoButtons)
        }else {
        
            self.makeAnimationForView(viewWithThreeButtons)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func AAAlertController(_ title:String,message:String,cancelButtonTitle:String,animationStyle:animationType,completionBlock: @escaping () -> (Void)){
        
        self.titleText = title
        self.messageText = message
        self.cancelButtonTitle = cancelButtonTitle
        self.oneViewFlag = true
        self.twoViewFlag = false
        self.threeViewFlag = false
        self.cancelCompletionBlock = completionBlock
        self.animationStyle = animationStyle
        
    }
    
    func AAAlertController(_ title:String,message:String,cancelButtonTitle:String,okButtonTitle:String,animationStyle:animationType,okCompletionBlock: @escaping () -> (Void),cancelCompletionBlock: @escaping () -> (Void)){
        
        self.titleText = title
        self.messageText = message
        self.cancelButtonTitle = cancelButtonTitle
        self.okButtonTitle = okButtonTitle
        self.oneViewFlag = false
        self.twoViewFlag = true
        self.threeViewFlag = false
        self.okCompletionBlock = okCompletionBlock
        self.cancelCompletionBlock = cancelCompletionBlock
        self.animationStyle = animationStyle
        
    }
    
    func AAAlertController(_ title:String,message:String,firstButtonTitle:String,secondButtonTitle:String,cancelButtonTitle:String,animationStyle:animationType,okCompletionBlock: @escaping () -> (Void),okCompletionBlock1: @escaping () -> (Void),cancelCompletionBlock: @escaping () -> (Void)){
        
        self.titleText = title
        self.messageText = message
        self.cancelButtonTitle = cancelButtonTitle
        self.okButtonTitle = firstButtonTitle
        self.okButtonTitle1 = secondButtonTitle
        self.oneViewFlag = false
        self.twoViewFlag = false
        self.threeViewFlag = true
        self.okCompletionBlock = okCompletionBlock
        self.okCompletionBlock1 = okCompletionBlock1
        self.cancelCompletionBlock = cancelCompletionBlock
        self.animationStyle = animationStyle
        
    }
    
    
    @objc
    fileprivate func cancelAAAlertController(_ cancelButtonSender :UIButton) {
        
        //* cancel alert Controller
        self.cancelCompletionBlock()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc
    fileprivate func okAAAlertController(_ okButtonSender :UIButton){
        
        //* executue completion block and cancel alert controller
        self.okCompletionBlock()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc
    fileprivate func okAAAlertController1(_ okButtonSender :UIButton){
        
        //* executue completion block and cancel alert controller
        self.okCompletionBlock1()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    fileprivate func makeAnimationForView(_ view:UIView){
    
        
        if animationType.default.hashValue == animationStyle.hashValue {
        
            // Start Zooming Animation
            view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            view.alpha = 0
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
                view.transform = CGAffineTransform(scaleX: 1, y: 1)
                view.alpha = 1
                }, completion: nil)
            
        }else if animationType.shake.hashValue == animationStyle.hashValue {
         
            let duration = 0.3
            let delay = 0.0
            
            // Start
            view.transform = CGAffineTransform(translationX: 0, y: 0)
            
            UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                view.transform = CGAffineTransform(translationX: 30, y: 0)
                }, completion: { (finished) in
                    
                    UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                        view.transform = CGAffineTransform(translationX: -30, y: 0)
                        
                        }, completion: { (finished) in
                            
                            UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                                view.transform = CGAffineTransform(translationX: 15, y: 0)
                                
                                }, completion: { (finished) in
                                    
                                    UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                                        view.transform = CGAffineTransform(translationX: -15, y: 0)
                                        
                                        }, completion: { (finished) in
                                            
                                            UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                                                
                                                view.transform = CGAffineTransform(translationX: 0, y: 0)
                                                
                                                }, completion: { (finished) in
                                                    
                                            })
                                    })
                            })
                    })
            })
            
        }else if animationType.slideDown.hashValue == animationStyle.hashValue {
        
            view.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
            
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransform(translationX: 0, y: 0)

                }, completion: nil)
            
        
        }else if animationType.slideUp.hashValue == animationStyle.hashValue {
        
        
            view.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
            
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransform(translationX: 0, y: 0)
                
                }, completion: nil)
            
        }else if animationType.slideRight.hashValue == animationStyle.hashValue {
            
            view.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width,y: 0)
            
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransform(translationX: 0, y: 0)
                
                }, completion: nil)
            
            
        }else if animationType.slideLeft.hashValue == animationStyle.hashValue {
            
            view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width,y: 0)
            
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransform(translationX: 0, y: 0)
                
                }, completion: nil)
            
            
        }else if animationType.fade.hashValue == animationStyle.hashValue {
        
            view.alpha = 0
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {

                view.alpha = 1

                }, completion: nil)
        
        }

    
    }
    
    
    
    fileprivate func caclulateAlertHeight(_ viewHeightConstraint:NSLayoutConstraint,view:UIView,messageLabel:UILabel,titleHeightConstraint:NSLayoutConstraint,titleLabel:UILabel){
        
        //* extend message to take title top
        if titleLabel.text == "" {
            titleHeightConstraint.constant = 0
        }
        
        //* calculate message height
        let actualMessageSize = calculateTextHeight(messageLabel)
        let messageSizeDifferance =  actualMessageSize - 53
        
        //* calculate title height
        let actualTitleSize = calculateTextHeight(titleLabel)
        let titleSizeDifferance =  actualTitleSize - 21
        
        if actualTitleSize > 21 {
            
            titleHeightConstraint.constant += titleSizeDifferance
            
        }
        
        if actualMessageSize > 53 {
            viewHeightConstraint.constant += messageSizeDifferance + titleHeightConstraint.constant
        }else {
            viewHeightConstraint.constant += titleHeightConstraint.constant - 20
        }
        
        self.view.layoutIfNeeded()

    
    }
    
    
    fileprivate func calculateTextHeight(_ LabelText:UILabel) -> CGFloat{
    
    let labelWidth = LabelText.frame.width
    let maxLabelSize = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)
    let actualLabelSize = LabelText.text!.boundingRect(with: maxLabelSize, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName: LabelText.font], context: nil)
        return actualLabelSize.height
    
    }
    
}
