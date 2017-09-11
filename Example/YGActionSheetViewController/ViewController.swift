//
//  ViewController.swift
//  YGActionSheetViewController
//
//  Created by hhgz9527 on 09/11/2017.
//  Copyright (c) 2017 hhgz9527. All rights reserved.
//

import UIKit
import YGActionSheetViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheetAction(_ sender: Any) {
        let vc = YGActionSheetViewController()
        vc.text = ["1", "2"]
        vc.action = { status in
            switch status {
            case .index(row: let row):
                debugPrint(row)
            case .cancel:
                debugPrint("cancel")
            }
            
        }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

