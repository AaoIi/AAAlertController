//
//  UIView+Animation.swift
//  AAAlertController
//
//  Created by Mobile build server on 8/7/19.
//  Copyright © 2019 AaoIi. All rights reserved.
//

import UIKit

extension UIView {
    
    func performDefaultAnimation(){
        
        // Start Zooming Animation
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.alpha = 1
        }, completion: nil)
        
    }
    
    func performShakeAnimation(){
        
        let duration = 0.3
        let delay = 0.0
        
        // Start
        self.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
            self.transform = CGAffineTransform(translationX: 30, y: 0)
        }, completion: { (finished) in
            
            UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                self.transform = CGAffineTransform(translationX: -30, y: 0)
                
            }, completion: { (finished) in
                
                UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                    self.transform = CGAffineTransform(translationX: 15, y: 0)
                    
                }, completion: { (finished) in
                    
                    UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                        self.transform = CGAffineTransform(translationX: -15, y: 0)
                        
                    }, completion: { (finished) in
                        
                        UIView.animateKeyframes(withDuration: duration/5, delay: delay, options: [], animations: {
                            
                            self.transform = CGAffineTransform(translationX: 0, y: 0)
                            
                        }, completion: { (finished) in
                            
                        })
                    })
                })
            })
        })
        
    }
    
    func performSlideDownAnimation(){
        
        self.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: nil)
        
    }
    
    
    func performSlideUpAnimation(){
        
        self.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: nil)
        
    }
    
    func performSlideRightAnimation(){
        
        self.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width,y: 0)
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: nil)
        
        
    }
    
    func performSlideLeftAnimation(){
        
        self.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width,y: 0)
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: nil)
        
    }
    
    
    func performFadeAnimation(){
        
        self.alpha = 0
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: [], animations: {
            
            self.alpha = 1
            
        }, completion: nil)
        
    }
    
    
}
