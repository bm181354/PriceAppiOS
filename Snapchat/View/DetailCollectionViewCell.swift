//
//  PriceApp
//
//  Created by Biken Maharjan on 7/22/18.

import UIKit

class DetailViewCell:UICollectionViewCell{
    

    // change
    let imageContent:UIImageView = {
       let iv = UIImageView()
       iv.image = UIImage(named: "rwdevcon-logo")
       iv.contentMode = UIViewContentMode.scaleAspectFit
       iv.translatesAutoresizingMaskIntoConstraints = false
       iv.backgroundColor = .white//UIColor(red: 243/255, green: 245/255, blue: 247/255, alpha: 1)
       return iv
    }()
    
    let titleView:UILabel = {
        let lb = UILabel()
        lb.text = "Fine Wine"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Roboto Condensed Light", size: 18)
        lb.sizeToFit()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let categoryView:UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Roboto Condensed Light", size: 8)
        lb.text = "Sample text about category here"
        lb.textColor = .gray
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let urlLabel:UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let costLabel:UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let  horizontalMargin:UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(red: 244/255, green: 246/255, blue: 246/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let refreshView:UIImageView = {
       let view = UIImageView()
       view.image = UIImage(named: "refresh")
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    let settingView:UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "setting")
        view.image!.withRenderingMode(.alwaysTemplate)
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let  verticalMargin:UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(red: 244/255, green: 246/255, blue: 246/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buyBtn:UIButton = {
        let bt = UIButton()
        bt.titleLabel?.font = UIFont(name: "Sabatica", size: 12)
        bt.setTitle("Price: $2.99", for: .normal)
        bt.backgroundColor = Color.getAccentColor()
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    // change this with rating
    let ratingView:UIButton = {
        let view = UIButton()
        view.setTitle("Rating :★★★★☆", for: .normal)
        view.backgroundColor = Color.secondaryAccentColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let subLabel:UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .gray
        lb.text = ""
        lb.font = UIFont(name: "Sabatica-regular", size: 11)
        return lb
    }()
    
    
    override func awakeFromNib() {

        backgroundColor = .white
        
        addSubview(imageContent)
        addSubview(titleView)
        addSubview(categoryView)
        addSubview(urlLabel)
        addSubview(costLabel)
        addSubview(horizontalMargin)
        addSubview(verticalMargin)
        addSubview(buyBtn)
        addSubview(ratingView)
        addSubview(subLabel)
//        addSubview(refreshView)
        
        setup()
        
   
    }

    private func setup(){
     
        // image
       imageContent.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 16).isActive = true
        imageContent.topAnchor.constraint(equalTo: self.topAnchor , constant: 16).isActive = true
        imageContent.widthAnchor.constraint(equalToConstant: self.frame.width/3 ).isActive = true
        imageContent.heightAnchor.constraint(equalToConstant: self.frame.width/2 ).isActive = true
        
        // category view
        categoryView.leadingAnchor.constraint(equalTo:imageContent.trailingAnchor , constant: 24).isActive = true
        categoryView.topAnchor.constraint(equalTo:self.topAnchor , constant: 16).isActive = true
        categoryView.trailingAnchor.constraint(equalTo:self.trailingAnchor , constant: -16).isActive = true
        
        // title
        titleView.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 16).isActive = true
        
        titleView.leadingAnchor.constraint(equalTo: imageContent.trailingAnchor, constant: 24).isActive = true
        titleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        titleView.bottomAnchor.constraint(equalTo: horizontalMargin.topAnchor, constant: -16)
        
        
         //margin
        horizontalMargin.topAnchor.constraint(equalTo: imageContent.bottomAnchor, constant: 16).isActive = true
        horizontalMargin.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horizontalMargin.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        horizontalMargin.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        verticalMargin.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        verticalMargin.topAnchor.constraint(equalTo: horizontalMargin.bottomAnchor, constant: 0).isActive = true
        verticalMargin.widthAnchor.constraint(equalToConstant: 2).isActive = true
        verticalMargin.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        // button
        buyBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        buyBtn.leadingAnchor.constraint(equalTo: verticalMargin.leadingAnchor, constant: 0).isActive = true
        //buyBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buyBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        buyBtn.topAnchor.constraint(equalTo: horizontalMargin.bottomAnchor, constant: 0).isActive = true
        buyBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true 
        
        // rating
        ratingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        ratingView.trailingAnchor.constraint(equalTo: verticalMargin.leadingAnchor, constant: 0).isActive = true
        ratingView.topAnchor.constraint(equalTo: horizontalMargin.bottomAnchor, constant: 0).isActive = true
        ratingView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        ratingView.topAnchor.constraint(equalTo: horizontalMargin.bottomAnchor, constant:0).isActive = true
        
        //subLabel
        
        subLabel.bottomAnchor.constraint(equalTo: imageContent.bottomAnchor, constant: 0).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: imageContent.trailingAnchor, constant: 24).isActive = true

// refresh
//        refreshView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
//        refreshView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
//        refreshView.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        refreshView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        
        
    }
    
    
    
    func setItemCellWith(item: Item) {
        DispatchQueue.main.async {
            self.titleView.text = item.title
            print("price: ",item.price)
            self.buyBtn.setTitle("Price: $\(item.price)", for: .normal)
            self.imageContent.loadImageUsingCacheWithURLString(item.mediaURL, placeHolder: UIImage(named: "placeholder"))
            
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 3
        self.clipsToBounds = true 
    }
    
    
    
}


