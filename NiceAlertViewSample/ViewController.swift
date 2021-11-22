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
        popUp.setup(title: "Titulo",
                    subtitle: "Mensagem de subtitulo",
                    btnConfirm: "Ok",
                    btnCancel: "cancelar",
                    { _ in })
        self.view.addSubview(popUp)
        
    }


}

