//
//  ARQuickLookViewController.swift
//  USDzExperience
//
//  Created by James Thang on 20/12/2022.
//

import UIKit
import QuickLook
import ARKit

class ARQuickLookViewController: UIViewController, QLPreviewControllerDataSource {
    
    private var isPresent = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !isPresent {
            let previewController = QLPreviewController()
            previewController.dataSource = self
            present(previewController, animated: true, completion: nil)
            isPresent = true
        }
        
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { return 1 }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let path = Bundle.main.path(forResource: "sneaker_pegasustrail", ofType: "usdz") else { fatalError("Couldn't find the supported input file.") }
        let url = URL(fileURLWithPath: path)
        return url as QLPreviewItem
    }

}
