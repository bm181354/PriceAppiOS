

import UIKit


protocol ChildMoveFromSuggestonVC{
    func moveToCamera()
}


class ChatViewController: UIViewController {
    
    var delegate:ChildMoveFromSuggestonVC? = nil
    var suggestionItem = [SuggestionItem]()
  
    @IBOutlet weak var isEmptyLabel: UILabel!
    // MARK: - IBOutlets
//  @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mainBackgroundView: UIView!
    //TODO: - change image to empty
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var btnScan: UIButton!
    @IBAction func btnScanned(_ sender: Any) {
        print("redirect to scan")
        delegate?.moveToCamera()
    }
    // MARK: - Properties
  var controllerColor: UIColor = UIColor(red: 0.23, green: 0.66, blue: 0.96, alpha: 1.0)
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    mainBackgroundView.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
    collectionView.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
    suggestionItem = fetchEverything()
    
    collectionView.reloadData()
    changeListener()
    
  }
}

// MARK: - ColoredView
extension ChatViewController: ColoredView {}

// MARK: - collectionViewDelegation
extension ChatViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (suggestionItem.count == 0 ){
            backImage.isHidden = false
            mainBackgroundView.isHidden = false
            btnScan.isHidden = false
            isEmptyLabel.isHidden = false
//            backImage.backgroundColor = .red
            print("Shown")
            return suggestionItem.count
        }else{
            // TODO:- do true to all
            let flagTest = true
            backImage.isHidden = flagTest
            btnScan.isHidden = flagTest
            mainBackgroundView.isHidden = flagTest
            isEmptyLabel.isHidden = flagTest
            print("Hidden")
            return suggestionItem.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SuggestionCollectionCell
        
//        print(suggestionItem.count)
//        print(suggestionItem[indexPath.row].id)
//        print(suggestionItem[indexPath.row].title)
          cell.setItemCellWith(suggestionItem: suggestionItem[indexPath.row])
//
          cell.layer.cornerRadius = 7.0
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.clear.cgColor
          cell.layer.masksToBounds = false
//
//        cell.layer.shadowColor = UIColor.gray.cgColor
//        cell.layer.shadowOpacity = 1
//        cell.layer.shadowOffset = CGSize(width: -4.0, height: 4.0)
//        cell.layer.shadowRadius = 10
//        cell.layer.masksToBounds = false
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius:      cell.contentView.layer.cornerRadius).cgPath
        
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.bounds.width - 50)/2, height: self.view.bounds.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select ",indexPath)
        
//        let sb = storyboard?.instantiateViewController(withIdentifier: "Main")
//        sb?.present(, animated: true, completion: nil)
        
//        let modalVC =  self.storyboard?.instantiateViewController(withIdentifier: "modalVCId") as! ModalVC
//
//        modalVC.suggestionItem = suggestionItem[indexPath.row]
//        // assign values here
//        self.present(modalVC, animated: true, completion: nil)
        
            let vc = NewSubDetailVC()
            vc.modalPresentationStyle = .custom
            vc.item = suggestionItem[indexPath.row]
            print(suggestionItem[indexPath.row])
            present(vc, animated: true, completion: nil)
        
        
        
        
    }


}

// MARK:- listen for change [Notification]
extension ChatViewController{
    
    func changeListener(){
        print("Listening for changes......")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.contextSave(_ :)),
                                               name: NSNotification.Name.NSManagedObjectContextObjectsDidChange,
                                               object: nil)
    }
    
    @objc func contextSave(_ notification: Notification) {
        suggestionItem = fetchEverything()
        print("Change2")
        collectionView.reloadData()
    }
    
}

