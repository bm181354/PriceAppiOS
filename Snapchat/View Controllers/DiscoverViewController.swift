

import UIKit

class DiscoverViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Properties
  var controllerColor: UIColor = UIColor(red: 0.59, green: 0.23, blue: 0.96, alpha: 1.0)
  
    var pageSize:CGFloat{
        return view.bounds.width
    }

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    backgroundView.backgroundColor = Color.getAccentColor()
    collectionView.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 247/255, alpha: 1)
    //backgroundView.layer.cornerRadius = 20
    //backgroundView.layer.masksToBounds = true
  }
}

// MARK: - ColoredView
extension DiscoverViewController: ColoredView {}

// MARK: - delegate and datasource
extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageSize - 8 , height:  view.bounds.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DetailViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: -16, bottom: 0, right: -16)
    }
    
}
