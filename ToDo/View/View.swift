//
//  View.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/14.
//

import UIKit
class CardView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initview()
    }
    
    private func initview() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        
        cornerRadius = 10
        
        
    }
}
