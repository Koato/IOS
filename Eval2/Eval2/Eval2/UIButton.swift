//
//  UIButton.swift
//  Eval2
//
//  Created by Koat on 5/25/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import UIKit

extension UIButton{
    func round(){
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func rebote(){
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }){ (completion) in UIView.animate(withDuration: 0.1, animations: {
            self.transform = .identity
            })
        }
    }
    
    func salta(){
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(translationX: 10, y: 0)
        }){ (completion) in UIView.animate(withDuration: 0.1, animations: {
            self.transform = .identity
            })
        }
    }
    
    func brilla(){
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }){ (completion) in UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 1
            })
        }
    }
}
