

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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            //controller.resetWithError()
             controller.reset()
             controller.dismiss(animated: true, completion: nil)
        }
        
        // fetch data Code
        
        
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





