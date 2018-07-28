//
//  SuggestionCollectionCell.swift
//  PriceApp
//
//  Created by Biken Maharjan on 7/27/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import UIKit

class SuggestionCollectionCell:UICollectionViewCell{
    
    let imageView:UIImageView={
       let iv = UIImageView()
       iv.backgroundColor = .red
        iv.translatesAutoresizingMaskIntoConstraints = false
       return iv
        
    }()
    
    let buttonView:UIButton={
       let bv = UIButton()
       bv.backgroundColor = UIColor(white: 1, alpha: 0.5)
       bv.translatesAutoresizingMaskIntoConstraints = false
       bv.setTitle("Name", for: .normal)
//       bv.backgroundColor = .clear
       return bv
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .red
        
        self.addSubview(imageView)
        self.addSubview(buttonView)
        
        // constraint
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        // constraint
        buttonView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        buttonView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }
    
    
    
}
