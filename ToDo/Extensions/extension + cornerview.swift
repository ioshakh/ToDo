//
//  extension + cornerview.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/14.
//

import UIKit

extension UIView {
  @IBInspectable  var cornerRadius : CGFloat {
    get { return self.cornerRadius }
        
        set{
            self.layer.cornerRadius = newValue
        }
    }
}



