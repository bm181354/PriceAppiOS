

import UIKit

class ChatViewController: UIViewController {
  
  // MARK: - IBOutlets
//  @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
  // MARK: - Properties
  var controllerColor: UIColor = UIColor(red: 0.23, green: 0.66, blue: 0.96, alpha: 1.0)
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }
}

// MARK: - ColoredView
extension ChatViewController: ColoredView {}

// MARK: - collectionViewDelegation
extension ChatViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SuggestionCollectionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.bounds.width - 50)/2, height: self.view.bounds.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select ",indexPath)
//        let sb = storyboard?.instantiateViewController(withIdentifier: "Main")
//        sb?.present(, animated: true, completion: nil)
        
        let modalVC =  self.storyboard?.instantiateViewController(withIdentifier: "modalVCId") as! ModalVC
        // assign values here 
        self.present(modalVC, animated: true, completion: nil)
        
    }
    
 
    

}

