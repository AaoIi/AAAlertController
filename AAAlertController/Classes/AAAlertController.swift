//
//  AAAlertController.swift
//  AAAlertController
//
//  Created by AaoIi on 4/13/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit


public enum animationType {
    case Default
    case Shake
    case SlideDown
    case SlideUp
    case SlideRight
    case SlideLeft
    case Fade
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
    private var titleText : String?
    private var messageText : String?
    private var cancelButtonTitle : String?
    private var okButtonTitle : String?
    // ok button title 1 is used for three button view (second button)
    private var okButtonTitle1 : String?
    private var oneViewFlag = false
    private var twoViewFlag = false
    private var threeViewFlag = false
    private var okCompletionBlock : () -> (Void) = {}
    // ok completion block 1 is used for three button view (second button)
    private var okCompletionBlock1 : () -> (Void) = {}
    private var cancelCompletionBlock : () -> (Void) = {}
    private var animationStyle : animationType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if oneViewFlag == true {
            
            //* setup for alert with cancel button
            self.viewWithTwoButtons.hidden = true
            self.viewOneButton.hidden = false
            self.viewWithThreeButtons.hidden = true
            
            self.titleLabel.text = titleText
            self.messageLabel.text = messageText
            self.cancelButton.setTitle(cancelButtonTitle, forState: UIControlState.Normal)
            self.cancelButton.addTarget(self, action: #selector(self.cancelAAAlertController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            caclulateAlertHeight(viewOneHeight, view: viewOneButton, messageLabel: messageLabel, titleHeightConstraint: titleLabelHeight, titleLabel: titleLabel)
            
        }else if twoViewFlag == true{
            
            //* setup for alert with action and cancel button
            self.viewWithTwoButtons.hidden = false
            self.viewOneButton.hidden = true
            self.viewWithThreeButtons.hidden = true
            
            self.titleLabel2.text = titleText
            self.messageLabel2.text = messageText
            
            self.cancelButton2.setTitle(cancelButtonTitle, forState: UIControlState.Normal)
            self.cancelButton2.addTarget(self, action: #selector(self.cancelAAAlertController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.okButton.setTitle(okButtonTitle, forState: UIControlState.Normal)
            self.okButton.addTarget(self, action: #selector(self.okAAAlertController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            caclulateAlertHeight(viewTwoHeight, view: viewWithTwoButtons, messageLabel: messageLabel2, titleHeightConstraint: titleLabel2Height, titleLabel: titleLabel2)

        }else {
        
            //* Setup for alert with two buttons and cancel button
            self.viewWithTwoButtons.hidden = true
            self.viewOneButton.hidden = true
            self.viewWithThreeButtons.hidden = false
        
            self.titleLabel3.text = titleText
            self.messageLabel3.text = messageText
            
            self.cancelButton3.setTitle(cancelButtonTitle, forState: UIControlState.Normal)
            self.cancelButton3.addTarget(self, action: #selector(self.cancelAAAlertController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.firstButton.setTitle(okButtonTitle, forState: UIControlState.Normal)
            self.firstButton.addTarget(self, action: #selector(self.okAAAlertController(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.secondButton.setTitle(okButtonTitle1, forState: UIControlState.Normal)
            self.secondButton.addTarget(self, action: #selector(self.okAAAlertController1(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            caclulateAlertHeight(viewThreeHeight, view: viewWithThreeButtons, messageLabel: messageLabel, titleHeightConstraint: titleLabel3Height, titleLabel: titleLabel3)
        
        }
        

    }
    
    override func viewWillAppear(animated: Bool) {
        
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

    func AAAlertController(title:String,message:String,cancelButtonTitle:String,animationStyle:animationType,completionBlock: () -> (Void)){
        
        self.titleText = title
        self.messageText = message
        self.cancelButtonTitle = cancelButtonTitle
        self.oneViewFlag = true
        self.twoViewFlag = false
        self.threeViewFlag = false
        self.cancelCompletionBlock = completionBlock
        self.animationStyle = animationStyle
        
    }
    
    func AAAlertController(title:String,message:String,cancelButtonTitle:String,okButtonTitle:String,animationStyle:animationType,okCompletionBlock: () -> (Void),cancelCompletionBlock: () -> (Void)){
        
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
    
    func AAAlertController(title:String,message:String,firstButtonTitle:String,secondButtonTitle:String,cancelButtonTitle:String,animationStyle:animationType,okCompletionBlock: () -> (Void),okCompletionBlock1: () -> (Void),cancelCompletionBlock: () -> (Void)){
        
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
    private func cancelAAAlertController(cancelButtonSender :UIButton) {
        
        //* cancel alert Controller
        self.cancelCompletionBlock()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @objc
    private func okAAAlertController(okButtonSender :UIButton){
        
        //* executue completion block and cancel alert controller
        self.okCompletionBlock()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @objc
    private func okAAAlertController1(okButtonSender :UIButton){
        
        //* executue completion block and cancel alert controller
        self.okCompletionBlock1()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    private func makeAnimationForView(view:UIView){
    
        
        if animationType.Default.hashValue == animationStyle.hashValue {
        
            // Start Zooming Animation
            view.transform = CGAffineTransformMakeScale(1.2, 1.2)
            view.alpha = 0
            
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: {
                view.transform = CGAffineTransformMakeScale(1, 1)
                view.alpha = 1
                }, completion: nil)
            
        }else if animationType.Shake.hashValue == animationStyle.hashValue {
         
            let duration = 0.3
            let delay = 0.0
            
            // Start
            view.transform = CGAffineTransformMakeTranslation(0, 0)
            
            UIView.animateKeyframesWithDuration(duration/5, delay: delay, options: [], animations: {
                view.transform = CGAffineTransformMakeTranslation(30, 0)
                }, completion: { (finished) in
                    
                    UIView.animateKeyframesWithDuration(duration/5, delay: delay, options: [], animations: {
                        view.transform = CGAffineTransformMakeTranslation(-30, 0)
                        
                        }, completion: { (finished) in
                            
                            UIView.animateKeyframesWithDuration(duration/5, delay: delay, options: [], animations: {
                                view.transform = CGAffineTransformMakeTranslation(15, 0)
                                
                                }, completion: { (finished) in
                                    
                                    UIView.animateKeyframesWithDuration(duration/5, delay: delay, options: [], animations: {
                                        view.transform = CGAffineTransformMakeTranslation(-15, 0)
                                        
                                        }, completion: { (finished) in
                                            
                                            UIView.animateKeyframesWithDuration(duration/5, delay: delay, options: [], animations: {
                                                
                                                view.transform = CGAffineTransformMakeTranslation(0, 0)
                                                
                                                }, completion: { (finished) in
                                                    
                                            })
                                    })
                            })
                    })
            })
            
        }else if animationType.SlideDown.hashValue == animationStyle.hashValue {
        
            view.transform = CGAffineTransformMakeTranslation(0, -CGRectGetHeight(UIScreen.mainScreen().bounds))
            
            UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransformMakeTranslation(0, 0)

                }, completion: nil)
            
        
        }else if animationType.SlideUp.hashValue == animationStyle.hashValue {
        
        
            view.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(UIScreen.mainScreen().bounds))
            
            UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransformMakeTranslation(0, 0)
                
                }, completion: nil)
            
        }else if animationType.SlideRight.hashValue == animationStyle.hashValue {
            
            view.transform = CGAffineTransformMakeTranslation(-CGRectGetWidth(UIScreen.mainScreen().bounds),0)
            
            UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransformMakeTranslation(0, 0)
                
                }, completion: nil)
            
            
        }else if animationType.SlideLeft.hashValue == animationStyle.hashValue {
            
            view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(UIScreen.mainScreen().bounds),0)
            
            UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: [], animations: {
                
                view.transform = CGAffineTransformMakeTranslation(0, 0)
                
                }, completion: nil)
            
            
        }else if animationType.Fade.hashValue == animationStyle.hashValue {
        
            view.alpha = 0
            UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: [], animations: {

                view.alpha = 1

                }, completion: nil)
        
        }

    
    }
    
    
    
    private func caclulateAlertHeight(viewHeightConstraint:NSLayoutConstraint,view:UIView,messageLabel:UILabel,titleHeightConstraint:NSLayoutConstraint,titleLabel:UILabel){
        
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
    
    
    private func calculateTextHeight(LabelText:UILabel) -> CGFloat{
    
    let labelWidth = LabelText.frame.width
    let maxLabelSize = CGSize(width: labelWidth, height: CGFloat.max)
    let actualLabelSize = LabelText.text!.boundingRectWithSize(maxLabelSize, options: [.UsesLineFragmentOrigin], attributes: [NSFontAttributeName: LabelText.font], context: nil)
        return actualLabelSize.height
    
    }
    
}
