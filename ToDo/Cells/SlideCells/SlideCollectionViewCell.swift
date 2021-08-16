//
//  SlideCollectionViewCell.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/14.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var slideImg: UIImageView!
    
    @IBOutlet weak var slideTitle: UILabel!
  
    func setup(_ slide : Slide) {
        slideImg.image = UIImage(named: slide.image!)
        slideTitle.text = slide.title
    }
    

}
