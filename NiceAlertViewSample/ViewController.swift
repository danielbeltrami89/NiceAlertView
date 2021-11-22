//
//  ViewController.swift
//  NiceAlertViewSample
//
//  Created by Daniel Beltrami on 21/11/21.
//

import UIKit
import NiceAlertView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let popUp = PopUpView()
        popUp.setup(title: "Title",
                    subtitle: "This is a nice text for a NiceAlertView made in swift for iOS apps",
                    btnConfirm: "Ok",
                    btnCancel: "cancel",
                    { _ in })
        self.view.addSubview(popUp)
        
    }


}

