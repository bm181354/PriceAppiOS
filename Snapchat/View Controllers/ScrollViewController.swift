

import UIKit

protocol ScrollViewControllerDelegate{
    // Protocols only takes computed property
    // list of all the view controller
    var viewControllers:[UIViewController]{ get }
    // initial viewcontroller
    var initialViewController:UIViewController { get }
    // did scroll [to get the context]
    func scrollViewDidScroll()
    
}

class ScrollViewController: UIViewController{
  
  // MARK: - Properties
  var scrollView: UIScrollView {
    return view as! UIScrollView
  }
  
  var pageSize: CGSize {
    return scrollView.frame.size
  }
  
  var viewControllers: [UIViewController?]!
    
  //
  var delegate:ScrollViewControllerDelegate?
    

    
  // MARK: - View Life Cycle
  override func loadView() {
    let scrollView = UIScrollView()
    scrollView.bounces = false
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.delegate = self
    scrollView.isPagingEnabled = true
    
    view = scrollView
    view.backgroundColor = .clear
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewControllers = delegate?.viewControllers
    
    //add the viewControllers to scrollView
    
    for (index,vc) in viewControllers.enumerated(){
        
        //  setting screen here : [on Screen]
        //  vc0-----[vc1]-----vc2
        if let controller = vc {
            addChildViewController(controller)
            
            if index == 0{
                let controller = controller as! ChatViewController
                controller.delegate = self
            }
            else if index == 2{
                let controller = controller as! DiscoverViewController
                    controller.delegate = self
            }
            // sets starting points
            controller.view.frame = frame(for: index)
            scrollView.addSubview(controller.view)
            controller.didMove(toParentViewController: self)
            
            
        }
        
    }
    // height and width 
    scrollView.contentSize = CGSize(width: pageSize.width * CGFloat(viewControllers.count), height: pageSize.height)
    // padding
    if let controller = delegate?.initialViewController{
         setController(to: controller, animate: true)
    }
    
  }
    
}

// MARK: - Private methods
fileprivate extension ScrollViewController {
  
  func frame(for index: Int) -> CGRect {
    return CGRect(x: CGFloat(index) * pageSize.width,
                  y: 0,
                  width: pageSize.width,
                  height: pageSize.height)
  }
  
  func indexFor(controller: UIViewController?) -> Int? {
    return viewControllers.index(where: {$0 == controller } )
  }
  
}

// MARK: - Scroll View Delegate
extension ScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // implemented by child
        delegate?.scrollViewDidScroll()
    }
    
    
}


// if not it will start from [x0] instead of x1 as our initial view
extension ScrollViewController{
    func setController(to controller:UIViewController, animate:Bool){
        
        guard let index = indexFor(controller: controller) else { return }
        print("index: \(index)")
        
        // move x0 --------- x1 -------- x2
        let contentOffset = CGPoint(x: pageSize.width * CGFloat(index), y: 0)
        
        if animate{
            
            UIView.animate(withDuration: 0.2, delay: 0, options: [UIViewAnimationOptions.curveEaseIn], animations: {
                 self.scrollView.setContentOffset(contentOffset, animated: false)
            }, completion: nil)
            
        }else{
            scrollView.setContentOffset(contentOffset, animated: animate)
        }
 
    }
}
//MARK: - extension

extension ScrollViewController:ChildMoveFromSuggestonVC{
  
    func moveToCamera() {
        let contentOffset = CGPoint(x: pageSize.width * CGFloat(1), y: 0)
            UIView.animate(withDuration: 0.2, delay: 0, options: [UIViewAnimationOptions.curveEaseIn], animations: {
                self.scrollView.setContentOffset(contentOffset, animated: false)
            }, completion: nil)
            
    }

}

extension ScrollViewController:ChildMoveFromHistoryVC{
  
}
