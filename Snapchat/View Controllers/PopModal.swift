//
//  PopModal.swift
//  PriceApp
//
//  Created by Biken Maharjan on 7/27/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import UIKit

class ModalVC:UIViewController{
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
