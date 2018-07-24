

import UIKit

class DiscoverViewController: UIViewController {
  
    private let refreshControl = UIRefreshControl()
  // MARK: - IBOutlets
  @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var settingView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Properties
  var controllerColor: UIColor = UIColor(red: 0.59, green: 0.23, blue: 0.96, alpha: 1.0)
  
    var pageSize:CGFloat{
        return view.bounds.width
    }

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingView.image!.withRenderingMode(.alwaysTemplate)
    settingView.tintColor = .white
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    
    backgroundView.backgroundColor = Color.getAccentColor()
    collectionView.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 247/255, alpha: 1)
    //backgroundView.layer.cornerRadius = 20
    //backgroundView.layer.masksToBounds = true
    
    //add Touch
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
    settingView.addGestureRecognizer(tapGesture)
    
    //
    // Add Refresh Control to Table View
    if #available(iOS 10.0, *) {
        collectionView.refreshControl = refreshControl
    } else {
        collectionView.addSubview(refreshControl)
    }
    refreshControl.tintColor = Color.getAccentColor()
    // Configure Refresh Control
    refreshControl.addTarget(self, action: #selector(refreshCoreData(_:)), for: .valueChanged)
  }
    
    @objc
    func tap(_ sender : UITapGestureRecognizer){
        print("hello ")
    }
    

   
}

// MARK: - ColoredView
extension DiscoverViewController: ColoredView {}

//MARK: - Refresh
extension DiscoverViewController{
    
    @objc private func refreshCoreData(_ sender: Any) {
        // Fetch Weather Data
        fetchCoreData()
    }
    
    private func fetchCoreData() {
        self.refreshControl.endRefreshing()
    }
    
}

// MARK: - delegate and datasource
extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageSize - 24 , height:  (view.bounds.height/3) - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DetailViewCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: 2, height: 4)
        cell.layer.shadowRadius = 10
        cell.layer.shouldRasterize = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: -16, bottom: 8, right: -16)
    }
 
}
extension DiscoverViewController{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
        let vc = SubDetailVC()
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
        
    }
}
