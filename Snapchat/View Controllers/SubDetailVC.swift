//
//  SubDetailVC.swift
//  PriceApp
//
//  Created by Biken Maharjan on 7/23/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import UIKit
import MapKit

class SubDetailVC:UIViewController {
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: self.view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return bdView
    }()
   lazy var segmentedControl:UISegmentedControl = {
        let items = ["Purple", "Green", "Blue"]
        let seg = UISegmentedControl(items:items)
        //seg.widthForSegment(at: 2)
        seg.setWidth((self.view.bounds.width/3) - 10, forSegmentAt: 0)
        seg.setWidth((self.view.bounds.width/3) - 10, forSegmentAt: 1)
        seg.setWidth((self.view.bounds.width/3) - 10, forSegmentAt: 2)
        seg.translatesAutoresizingMaskIntoConstraints = false
        return seg
    }()
    
    let productView:UIImageView = {
       let pv = UIImageView()
        pv.backgroundColor = .white
        pv.image = UIImage(named: "rwdevcon-logo")
        pv.contentMode =  UIViewContentMode.scaleAspectFit
        pv.layer.cornerRadius = 4
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    let _infoView:UILabel = {
        let lb = UILabel()
        lb.text = "Info"
        lb.textColor = Color.getAccentColor()
        lb.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let titleView:UILabel = {
       let lb = UILabel()
        lb.text = "Product name"
        lb.textColor = Color.getAccentColor()
        lb.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        lb.translatesAutoresizingMaskIntoConstraints = false
       return lb
    }()
    
    lazy var removeBtn:UIButton = {
    
        let btn = UIButton()
        btn.backgroundColor = Color.negativeColor()
        btn.setTitle("Remove", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 14
        return btn
    }()
    
    var menuView = UIView()
    let menuHeight = (UIScreen.main.bounds.height / 2) + 60
    var isPresenting = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menuView.layer.cornerRadius = 15
        menuView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .clear
        view.addSubview(backdropView)
        view.addSubview(menuView)
        menuView.addSubview(removeBtn)
        menuView.addSubview(titleView)
        menuView.addSubview(productView)
        menuView.addSubview(_infoView)
        menuView.addSubview(segmentedControl)
        
        menuView.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 247/255, alpha: 1)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.heightAnchor.constraint(equalToConstant: menuHeight).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        //Remove Button
        removeBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        removeBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 16).isActive = true
        removeBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        removeBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        // titleView
        titleView.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 16).isActive = true
        titleView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 16).isActive = true
        
        // productView
        productView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16).isActive = true
        productView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 14).isActive = true
        productView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -14).isActive = true
        
        productView.heightAnchor.constraint(equalToConstant: self.view.bounds.width/2).isActive = true

        //_infoView
        _infoView.topAnchor.constraint(equalTo: productView.bottomAnchor, constant: 16).isActive = true
        _infoView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: 8).isActive = true
        _infoView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 16).isActive = true
        
        //segmentedControl
        segmentedControl.topAnchor.constraint(equalTo: _infoView.bottomAnchor, constant: 8).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -16).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 16).isActive = true
        segmentedControl.bottomAnchor.constraint(equalTo: removeBtn.topAnchor, constant: -16).isActive = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SubDetailVC.handleTap(_:)))
        backdropView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}

extension SubDetailVC: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        guard let toVC = toViewController else { return }
        isPresenting = !isPresenting
        
        if isPresenting == true {
            containerView.addSubview(toVC.view)
            
            menuView.frame.origin.y += menuHeight
            backdropView.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y -= self.menuHeight
                self.backdropView.alpha = 1
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y += self.menuHeight
                self.backdropView.alpha = 0
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        }
    }
    
}
