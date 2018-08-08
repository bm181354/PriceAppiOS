

import UIKit

protocol ColoredView {
  var controllerColor: UIColor { get set }
}

class MainViewController: UIViewController {
  
  // MARK: - Properties
  var scrollViewController: ScrollViewController!
  
  lazy var chatViewController: UIViewController! = {
    return self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController")
  }()
  
  lazy var discoverViewController: UIViewController! = {
    return self.storyboard?.instantiateViewController(withIdentifier: "DiscoverViewController")
  }()

 lazy var lensViewController: UIViewController! = {
    return self.storyboard?.instantiateViewController(withIdentifier: "LensViewController")
  }()
  
  var cameraViewController: CameraViewController!
  
  // MARK: - IBOutlets
  @IBOutlet var navigationView: NavigationView!
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  // run at beginning even before viewDidLoad
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    // camera part 1
    if let controller = segue.destination as? CameraViewController {
      cameraViewController = controller
    // scroll part 2
    } else if let controller = segue.destination as? ScrollViewController {
      scrollViewController = controller
      scrollViewController.delegate = self
        
    }
    
  }
}

// MARK: - IBActions
extension MainViewController {
  
  @IBAction func handleChatIconTap(_ sender: UITapGestureRecognizer) {
    scrollViewController.setController(to: chatViewController, animate: true)
  }
  
  @IBAction func handleDiscoverIconTap(_ sender: UITapGestureRecognizer) {
    scrollViewController.setController(to: discoverViewController, animate: true)
  }
  
  @IBAction func handleCameraButton(_ sender: UITapGestureRecognizer) {
    scrollViewController.setController(to: lensViewController, animate: true)    
  }
}

extension MainViewController:ScrollViewControllerDelegate{
    
    // called by delegate from ScrollViewController when view is Scrolled
    func scrollViewDidScroll() {
        
        let min:CGFloat = 0
        // width [phone's width]
        let max:CGFloat = scrollViewController.pageSize.width
        
        // this keeps on changing (delta x,y) as we scroll
        let x = scrollViewController.scrollView.contentOffset.x
        
        let regular = ((x - min)/(max - min))  // 0..1..2
        let result = regular - 1 // -1..0...1
        print(result)  // context is known by MainViewController; I'm at _result_ index
        navigationView.animate(to: result)
        
    }
    
    // get
    var viewControllers: [UIViewController] {
        return [chatViewController,lensViewController,discoverViewController]
    }
    var initialViewController: UIViewController {
        return lensViewController
    }
    
}


