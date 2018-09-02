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
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
       return iv
    }()
    
    let buttonView:UIButton={
       let bv = UIButton()
       bv.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
       bv.translatesAutoresizingMaskIntoConstraints = false
       bv.setTitle("Name", for: .normal)
//       bv.backgroundColor = .clear
       return bv
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(imageView)
        self.addSubview(buttonView)
        
        self.backgroundColor = .white
        
        // constraint
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -8).isActive = true
        
        // constraint
        buttonView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        buttonView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //shadow
        
        
    }
    
    func setItemCellWith(suggestionItem: SuggestionItem) {
        DispatchQueue.main.async {
            //imageViewself.titleView.text = suggestionItem.title
            print("price: ",suggestionItem.price)
            self.buttonView.setTitle(" $\(suggestionItem.price)", for: .normal)
            self.imageView.loadImageUsingCacheWithURLString(suggestionItem.mediaURL, placeHolder: UIImage(named: "placeholder"))
            
        }
    }
    
    
    
}
