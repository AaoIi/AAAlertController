//
//  AlertController.swift
//  AlertController
//
//  Created by AaoIi on 4/13/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit

public class AlertController: UIViewController {
    
    public enum animationType{
        case `default`
        case shake
        case slideDown
        case slideUp
        case slideRight
        case slideLeft
        case fade
    }
    
    enum type {
        case single
        case double
        case triple
    }
    
    //* create alert with one cancel button
    @IBOutlet fileprivate var viewOneButton: UIView!
    @IBOutlet fileprivate var viewOneHeight: NSLayoutConstraint!
    @IBOutlet fileprivate var titleLabel: UILabel!
    @IBOutlet fileprivate var titleLabelHeight: NSLayoutConstraint!
    @IBOutlet fileprivate var messageLabel: UILabel!
    @IBOutlet fileprivate var cancelButton: UIButton!
    
    //* create alert with cancel and action button
    @IBOutlet fileprivate var viewWithTwoButtons: UIView!
    @IBOutlet fileprivate var viewTwoHeight: NSLayoutConstraint!
    @IBOutlet fileprivate var titleLabel2: UILabel!
    @IBOutlet fileprivate var titleLabel2Height: NSLayoutConstraint!
    @IBOutlet fileprivate var messageLabel2: UILabel!
    @IBOutlet fileprivate var cancelButton2: UIButton!
    @IBOutlet fileprivate var okButton: UIButton!
    
    //* create alert with cancel and two action buttons
    @IBOutlet fileprivate var viewWithThreeButtons: UIView!
    @IBOutlet fileprivate var viewThreeHeight: NSLayoutConstraint!
    @IBOutlet fileprivate var titleLabel3: UILabel!
    @IBOutlet fileprivate var titleLabel3Height: NSLayoutConstraint!
    @IBOutlet fileprivate var messageLabel3: UILabel!
    @IBOutlet fileprivate var firstButton: UIButton!
    @IBOutlet fileprivate var secondButton: UIButton!
    @IBOutlet fileprivate var cancelButton3: UIButton!
    
    //* local variables
    fileprivate var titleText : String?
    fileprivate var messageText : String?
    fileprivate var cancelButtonTitle : String?
    fileprivate var firstButtonTitle : String?
    fileprivate var secondButtonTitle : String?
    fileprivate var viewType : type = .single
    fileprivate var firstActionCompletion : () -> (Void) = {}
    fileprivate var secondActionCompletion : () -> (Void) = {}
    fileprivate var cancelCompletionBlock : () -> (Void) = {}
    fileprivate var animationStyle : animationType!
    
    
    //MARK:- Life Cycle
    
    override required init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @available(*,unavailable)
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
    }
    
    @available(*,unavailable)
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch viewType {
        case .single:
            self.performAnimation(viewOneButton)
            break;
        case .double:
            self.performAnimation(viewWithTwoButtons)
            break;
        case .triple:
            self.performAnimation(viewWithThreeButtons)
            break;
        }

    }

    //MARK:- Core init
    
    fileprivate func setupView(){
        
        switch viewType {
        case .single:
            
            //* setup for alert with cancel button
            self.viewWithTwoButtons.isHidden = true
            self.viewOneButton.isHidden = false
            self.viewWithThreeButtons.isHidden = true
            
            self.titleLabel.text = titleText
            self.messageLabel.text = messageText
            self.cancelButton.setTitle(cancelButtonTitle, for: UIControl.State())
            self.cancelButton.addTarget(self, action: #selector(self.cancelAlertController(_:)), for: UIControl.Event.touchUpInside)
            
            caclulateAlertHeight(viewOneHeight, view: viewOneButton, messageLabel: messageLabel, titleHeightConstraint: titleLabelHeight, titleLabel: titleLabel)
            
            
            break;
        case .double:
            
            //* setup for alert with action and cancel button
            self.viewWithTwoButtons.isHidden = false
            self.viewOneButton.isHidden = true
            self.viewWithThreeButtons.isHidden = true
            
            self.titleLabel2.text = titleText
            self.messageLabel2.text = messageText
            
            self.cancelButton2.setTitle(cancelButtonTitle, for: UIControl.State())
            self.cancelButton2.addTarget(self, action: #selector(self.cancelAlertController(_:)), for: UIControl.Event.touchUpInside)
            
            self.okButton.setTitle(firstButtonTitle, for: UIControl.State())
            self.okButton.addTarget(self, action: #selector(self.okAlertController(_:)), for: UIControl.Event.touchUpInside)
            
            caclulateAlertHeight(viewTwoHeight, view: viewWithTwoButtons, messageLabel: messageLabel2, titleHeightConstraint: titleLabel2Height, titleLabel: titleLabel2)
            
            break;
        case .triple:
            
            //* Setup for alert with two buttons and cancel button
            self.viewWithTwoButtons.isHidden = true
            self.viewOneButton.isHidden = true
            self.viewWithThreeButtons.isHidden = false
            
            self.titleLabel3.text = titleText
            self.messageLabel3.text = messageText
            
            self.cancelButton3.setTitle(cancelButtonTitle, for: UIControl.State())
            self.cancelButton3.addTarget(self, action: #selector(self.cancelAlertController(_:)), for: UIControl.Event.touchUpInside)
            
            self.firstButton.setTitle(firstButtonTitle, for: UIControl.State())
            self.firstButton.addTarget(self, action: #selector(self.okAlertController(_:)), for: UIControl.Event.touchUpInside)
            
            self.secondButton.setTitle(secondButtonTitle, for: UIControl.State())
            self.secondButton.addTarget(self, action: #selector(self.okAlertController1(_:)), for: UIControl.Event.touchUpInside)
            
            caclulateAlertHeight(viewThreeHeight, view: viewWithThreeButtons, messageLabel: messageLabel, titleHeightConstraint: titleLabel3Height, titleLabel: titleLabel3)
            
            break;
        }
        
    }
    
    fileprivate func AlertController(_ title:String,message:String,cancelButtonTitle:String,animationStyle:animationType,completionBlock: @escaping () -> (Void)){
        
        self.titleText = title
        self.messageText = message
        self.cancelButtonTitle = cancelButtonTitle
        self.viewType = .single
        self.cancelCompletionBlock = completionBlock
        self.animationStyle = animationStyle
        
    }
    
    fileprivate func AlertController(_ title:String,message:String,cancelButtonTitle:String,firstButtonTitle:String,animationStyle:animationType,firstActionCompletion: @escaping () -> (Void),cancelCompletionBlock: @escaping () -> (Void)){
        
        self.titleText = title
        self.messageText = message
        self.cancelButtonTitle = cancelButtonTitle
        self.firstButtonTitle = firstButtonTitle
        self.viewType = .double
        self.firstActionCompletion = firstActionCompletion
        self.cancelCompletionBlock = cancelCompletionBlock
        self.animationStyle = animationStyle
        
    }
    
    fileprivate func AlertController(_ title:String,message:String,firstButtonTitle:String,secondButtonTitle:String,cancelButtonTitle:String,animationStyle:animationType,firstActionCompletion: @escaping () -> (Void),secondActionCompletion: @escaping () -> (Void),cancelCompletionBlock: @escaping () -> (Void)){
        
        self.titleText = title
        self.messageText = message
        self.cancelButtonTitle = cancelButtonTitle
        self.firstButtonTitle = firstButtonTitle
        self.secondButtonTitle = secondButtonTitle
        self.viewType = .triple
        self.firstActionCompletion = firstActionCompletion
        self.secondActionCompletion = secondActionCompletion
        self.cancelCompletionBlock = cancelCompletionBlock
        self.animationStyle = animationStyle
        
    }
    
    //MARK:- Handlers
    
    @objc
    fileprivate func cancelAlertController(_ cancelButtonSender :UIButton) {
        
        //* cancel alert Controller
        self.cancelCompletionBlock()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc
    fileprivate func okAlertController(_ okButtonSender :UIButton){
        
        //* executue completion block and cancel alert controller
        self.firstActionCompletion()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc
    fileprivate func okAlertController1(_ okButtonSender :UIButton){
        
        //* executue completion block and cancel alert controller
        self.secondActionCompletion()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK:- View Animation
    
    fileprivate func performAnimation(_ view:UIView){
        
        guard let animationStyle = animationStyle else {return}
        
        switch animationStyle {
        case .default:
            view.performDefaultAnimation()
            break;
        case .shake:
            view.performShakeAnimation()
            break;
        case .slideDown:
            view.performSlideDownAnimation()
            break;
        case .slideUp:
            view.performSlideUpAnimation()
            break;
        case .slideRight:
            view.performSlideRightAnimation()
            break;
        case .slideLeft:
            view.performSlideLeftAnimation()
            break;
        case .fade:
            view.performFadeAnimation()
            break;

        }
        
        
    }
    
    //MARK:- Alert Calculator
    
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
        let actualLabelSize = LabelText.text?.boundingRect(with: maxLabelSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: LabelText.font ?? UIFont.systemFontSize], context: nil)
        return actualLabelSize?.height ?? 0
        
    }
    
}


// MARK: - Responsible to Show Alert
public extension AlertController {
    
    class func show(_ title:String?,message:String?,cancelButtonTitle:String,completionBlock: @escaping ()->(Void),animationStyle:animationType = .default){
        
        let bundle = Bundle(path: Bundle(for: self.classForCoder()).path(forResource: "AlertController", ofType: "bundle")!)
        let alertView = self.init(nibName: "AlertController", bundle: bundle)
        alertView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.AlertController(title ?? "", message: message ?? "", cancelButtonTitle: cancelButtonTitle,animationStyle:animationStyle, completionBlock:completionBlock)
        
        alertView.show(animated: true)
        
    }
    
    class func show(_ title:String?,message:String?,firstButtonTitle:String,firstActionCompletion: @escaping ()->(Void),cancelButtonTitle:String,cancelCompletionBlock: @escaping ()->(Void),animationStyle:animationType = .default){
        
        let bundle = Bundle(path: Bundle(for: self.classForCoder()).path(forResource: "AlertController", ofType: "bundle")!)
        let alertView = self.init(nibName: "AlertController", bundle: bundle)
        alertView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        alertView.AlertController(title ?? "", message: message ?? "", cancelButtonTitle: cancelButtonTitle, firstButtonTitle: firstButtonTitle,animationStyle:animationStyle, firstActionCompletion: firstActionCompletion, cancelCompletionBlock: cancelCompletionBlock)
        
        
        alertView.show(animated: true)
        
    }
    
    class func show(_ title:String?,message:String?,firstButtonTitle:String,firstButtonCompletionBlock: @escaping ()->(Void),secondButtonTitle:String,secondButtonCompletionBlock: @escaping ()->(Void),cancelButtonTitle:String,cancelCompletionBlock: @escaping ()->(Void),animationStyle:animationType = .default){
        
        let bundle = Bundle(path: Bundle(for: self.classForCoder()).path(forResource: "AlertController", ofType: "bundle")!)
        let alertView = self.init(nibName: "AlertController", bundle: bundle)
        alertView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        alertView.AlertController(title ?? "", message: message ?? "", firstButtonTitle: firstButtonTitle, secondButtonTitle: secondButtonTitle, cancelButtonTitle: cancelButtonTitle, animationStyle: animationStyle, firstActionCompletion: firstButtonCompletionBlock, secondActionCompletion: secondButtonCompletionBlock, cancelCompletionBlock: cancelCompletionBlock)
        
        alertView.show(animated: true)
        
    }
    
}
