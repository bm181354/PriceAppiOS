

import UIKit
import BarcodeScanner

class LensViewController:BarcodeScannerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.codeDelegate = self
        self.errorDelegate = self
        self.dismissalDelegate = self

      
        self.headerViewController.closeButton.tintColor = .white
        //self.headerViewController.titleLabel.text = "Check Product"
        self.headerViewController.titleLabel.textColor = .white
        self.cameraViewController.barCodeFocusViewType = .animated
        self.cameraViewController.showsCameraButton = true
        self.headerViewController.titleLabel.text = nil
        
        
        
        
        
        


    }

      override var prefersStatusBarHidden: Bool {
        return false
      }
    
    private func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        return viewController
    }
    
    
}

// delegate
extension LensViewController: BarcodeScannerCodeDelegate {
   
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        
        print("Barcode Data: \(code)")
        print("Symbology Type: \(type)")
        
       
        
        // fetch data Code
        APIService.shared.fetchProduct(code: code) { (data) in
            switch data{
            case .Success(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!) as? [String: [AnyObject]]
                    {
                        if let item = json["items"]{
                            //                                                    ["name"] , let price = item[0]["msrp"], let rating = item[0]["customerRating"], let id = item[0]["upc"], let imageUrl = item[0]["largeImage"]
                            print("Success")
                            let item = item[0]
                            
                            guard let title =  item["name"] , let price = item["msrp"], let rating = item["customerRating"], let id = item["upc"], let imageUrl = item["largeImage"]
                                else{
                                    return
                            }
                            
                            guard let title1 = title, let price1 = price, let rating1 = rating, let id1 = id, let imageUrl1 = imageUrl else{
                                return
                            }
                            
                            
                            let dictionary = ["title": title1,
                                              "price": price1,
                                              "rating": rating1,
                                              "id": id1,
                                              "mediaURL": imageUrl1
                            ]
                            //                                                    print(dictionary)
                            //
                            //                                                    _ = self.createItemEntityFrom(dictionary: dictionary)
                            
                            guard let n = price as? NSNumber else{
                                return
                            }
                            let f = n.floatValue
                            
                            self.updateEntity(id: id1 as! String, with:f , with: rating1 as! String, dictionary: dictionary)
                            
                            DispatchQueue.main.async{
                                controller.reset()
                                controller.dismiss(animated: true, completion: nil)
                            }
                            
                            do {
                                try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
                            } catch let error {
                                print(error)
                            }
                            
                            
                        }else{
                            // json is empty
                            
                            
                        }
                        
                        //                        print(json["items"]![0]["itemId"])
                        
                    }
                } catch let error {
                    print(error)
                }
            case .Error(let message):
                print(message)
            }
            
        }
        
        
        // notify to all or
        
        // save to coredata
        
    }
    
    func barcodeScanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        
        print("Barcode Data: \(code)")
        print("Symbology Type: \(type)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            //controller.resetWithError()
             controller.reset()
        }
    }
}
//
extension LensViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print("Error")
        controller.reset()
    }
    
    func barcodeScanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
        controller.reset()
    }
}
//
extension LensViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        print("s")
        controller.dismiss(animated: true, completion: nil)
    }
    
    func barcodeScannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
//





