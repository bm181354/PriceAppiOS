

import UIKit
import BarcodeScanner
import SwiftyJSON

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
        
        var code = "035000521019"
        code = "046500018428"
        
//        APIService.shared.fetchProduct(code: code) { (data) in
//
//            switch data{
//            case .Success(let data):
//                let json = JSON(data)
//                print(json)
//
//                if let id = json["items"][0]["itemId"].int, let price = json["items"][0]["msrp"].float ?? json["items"][0]["salePrice"].float, let mediaURL = json["items"][0]["mediumImage"].string, let title = json["items"][0]["name"].string, let rating = json["items"][0]["customerRating"].string  {
//
//                  self.updateEntity(id: Int64(id), withPrice: price, withRating: rating, withTitle: title, withMediaURL: mediaURL)
//                   print("hello")
//
//                    self.update(product: "15610479")
//
//                    //send the message to charviewController
//
//                }else {
//                  //error
//                   print("json parsing error")
//
//                }
//
//
//
//            case .Error(let message):
//                print(message)
//            }
//
//        }
        
        
        
        
       

        
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
        
        
        
        
       
        doAPICalls(code: code, controller: controller)
        
        
        
        
        
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
// UIAlert
extension LensViewController{
    
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //We add buttons to the alert controller by creating UIAlertActions:
        let actionOk = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil) //You can use a block here to handle a press on this button
        
        alertController.addAction(actionOk)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //
    func doAPICalls(code:String, controller: BarcodeScannerViewController){
        
        // fetch data Code
        APIService.shared.fetchProduct(code: code) { (data) in
            
            switch data{
            case .Success(let data):
                let json = JSON(data)
              
                
                if let id = json["items"][0]["itemId"].int, let price = json["items"][0]["msrp"].float ?? json["items"][0]["salePrice"].float, let mediaURL = json["items"][0]["mediumImage"].string, let title = json["items"][0]["name"].string, let rating = json["items"][0]["customerRating"].string  {
                    
                    _ = self.updateEntity(id: Int64(id), withPrice: price, withRating: rating, withTitle: title, withMediaURL: mediaURL)
                    
                    self.update(product: "\(id)")
                    
                    
                }else {
                    //error parsing the json
                    print("json parsing error")
                    
                }
                
                
                
            case .Error(let message):
                //network error
                print(message)
            }
            
        }
        
        
    }
    
    
    
}







