//
//  PopupSimples.swift
//  teste
//
//  Created by Daniel Beltrami on 23/02/21.
//  Copyright © 2021 Radio Controle. All rights reserved.
//

import UIKit

///let popUp = PopUpView()
///popUp.setup(...)
///self.view.addSubview(popUp)
public class PopUpView: BasePopUp {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Montar a stack com os itens
        self.setupStack(views: [self.title, self.subTitle, self.confirmBtn, self.cancelBtn])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(title: String, subtitle: String, btnConfirm: String, btnCancel: String, _ callback: @escaping (Bool) -> ()) {
        self.title.text = title
        self.subTitle.text = subtitle
        self.confirmBtn.setTitle(btnConfirm, for: .normal)
        
        if btnCancel == "" {
            self.cancelBtn.isHidden = true
        } else {
            self.cancelBtn.setTitle(btnCancel, for: .normal)
        }
        
        self.confirmBtn.addAction(for: .touchUpInside) {
            self.removeFromSuperview()
            callback(true)

        }
     
    }
}
