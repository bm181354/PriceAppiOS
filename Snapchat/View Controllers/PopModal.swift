//
//  PopModal.swift
//  PriceApp
//
//  Created by Biken Maharjan on 7/27/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import UIKit

class ModalVC:UIViewController{
    
    // didset doesn't work here
    var suggestionItem:SuggestionItem?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = suggestionItem{
            labelTitle.text = item.title
            image.loadImageUsingCacheWithURLString(item.mediaURL, placeHolder: UIImage(named: "placeholder"))
        }
        
        
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
