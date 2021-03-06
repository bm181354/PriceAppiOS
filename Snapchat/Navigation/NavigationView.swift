import UIKit

class NavigationView: UIView {
  
  // MARK: - Properties
  lazy var cameraButtonWidthConstraintConstant: CGFloat = {
    return self.cameraButtonWidthConstraint.constant
  }()
  lazy var cameraButtonBottomConstraintConstant: CGFloat = {
    return self.cameraButtonBottomConstraint.constant
  }()
  lazy var chatIconWidthConstraintConstant: CGFloat = {
    return self.chatIconWidthConstraint.constant
  }()
  lazy var chatIconBottomConstraintConstant: CGFloat = {
    return self.chatIconBottomConstraint.constant
  }()
  lazy var chatIconHorizontalConstraintConstant: CGFloat = {
    return self.chatIconHorizontalConstraint.constant
  }()
  lazy var discoverIconHorizontalConstraintConstant: CGFloat = {
    return self.discoverIconHorizontalConstraint.constant
  }()
  lazy var indicatorTransform: CGAffineTransform = {
    return self.cameraButtonView.transform
  }()
  
  @IBOutlet var cameraButtonView: UIView!
  @IBOutlet var cameraButtonWhiteView: UIImageView!
  @IBOutlet var cameraButtonGrayView: UIImageView!
  @IBOutlet var cameraButtonWidthConstraint: NSLayoutConstraint!
  @IBOutlet var cameraButtonBottomConstraint: NSLayoutConstraint!
  
  @IBOutlet var chatIconView: UIView!
  @IBOutlet var chatIconWhiteView: UIImageView!
  @IBOutlet var chatIconGrayView: UIImageView!
  @IBOutlet var chatIconWidthConstraint: NSLayoutConstraint!
  @IBOutlet var chatIconBottomConstraint: NSLayoutConstraint!
  @IBOutlet var chatIconHorizontalConstraint: NSLayoutConstraint!
  
  @IBOutlet var discoverIconView: UIView!
  @IBOutlet var discoverIconWhiteView: UIImageView!
  @IBOutlet var discoverIconGrayView: UIImageView!
  @IBOutlet var discoverIconHorizontalConstraint: NSLayoutConstraint!
  
  @IBOutlet var indicator: UIView!
  
  @IBOutlet var colorView: UIView!
  
  // MARK: - Internal
  func shadow(layer: CALayer, color: UIColor) {
    layer.shadowColor = color.cgColor
    layer.masksToBounds = false
    layer.shadowOffset = .zero
    layer.shadowOpacity = 1.0
    layer.shadowRadius = 0.5
  }
  
  func setup() {
    shadow(layer: cameraButtonWhiteView.layer, color: .black)
    shadow(layer: chatIconWhiteView.layer, color: .darkGray)
    shadow(layer: discoverIconWhiteView.layer, color: .darkGray)
  }
  
  // MARK: - View Life Cycle
  override func layoutSubviews() {
    super.layoutSubviews()
    
    //chatIconWhiteView.layer.shadowOffset =
    chatIconWhiteView.layer.shadowColor = UIColor.gray.cgColor
    chatIconWhiteView.layer.shadowOpacity = 1
    chatIconWhiteView.layer.shadowOffset = CGSize(width: 4, height: 4)
    chatIconWhiteView.layer.shadowRadius = 10
    chatIconWhiteView.layer.shouldRasterize = true
    
    
    discoverIconWhiteView.layer.shadowColor = UIColor.gray.cgColor
    discoverIconWhiteView.layer.shadowOpacity = 1
    discoverIconWhiteView.layer.shadowOffset = CGSize(width: 4, height: 4)
    discoverIconWhiteView.layer.shadowRadius = 10
    discoverIconWhiteView.layer.shouldRasterize = true
    
    
    cameraButtonWhiteView.layer.shadowColor = UIColor.gray.cgColor
    cameraButtonWhiteView.layer.shadowOpacity = 1
    cameraButtonWhiteView.layer.shadowOffset = CGSize(width: 4, height: 4)
    cameraButtonWhiteView.layer.shadowRadius = 10
    cameraButtonWhiteView.layer.shouldRasterize = true
    
    indicator.layer.cornerRadius = indicator.bounds.height / 2
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    cameraButtonWhiteView.image = cameraButtonWhiteView.image!.withRenderingMode(.alwaysTemplate)
    cameraButtonWhiteView.tintColor = Color.getAccentColor()
    chatIconWhiteView.image = chatIconWhiteView.image!.withRenderingMode(.alwaysTemplate)
    chatIconWhiteView.tintColor = Color.getAccentColor()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
    
    
    func animate(to percent:CGFloat){
        let offset = abs(percent)
        
        cameraButtonWhiteView.alpha = offset
        cameraButtonGrayView.alpha = offset
        
        
        
        animateIconColor(offset: offset)
        animateIconPosition(offset: offset)
        animateIconCenter(offset: offset)
        animateIconScale(offset: offset)
        
        animateBottomBar(percent: percent)
        
        layoutIfNeeded()

    }
}

