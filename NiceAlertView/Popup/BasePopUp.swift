//
//  BasePopUp.swift
//  RCPlay
//
//  Created by Daniel Beltrami on 21/02/21.
//  Copyright © 2021 Radio Controle. All rights reserved.
//

import UIKit
import SnapKit

public class BasePopUp: UIView {
    
    lazy var stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        return stackView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        //label.font = Fonts.Bold.of(size: 18)
        label.textColor = .darkText
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        //label.font = Fonts.Medium.of(size: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let viewSubTitle: UIView = {
        let view = UIView()
        return view
    }()
    
    let confirmBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        //button.titleLabel?.font = Fonts.SemiBold.of(size: 16)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let cancelBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(.blue, for: .normal)
        //button.titleLabel?.font = Fonts.Medium.of(size: 16)
        return button
    }()
    
    let field: UITextField = {
        let field = UITextField()
        //field.font = Fonts.Medium.of(size: 14)
        field.textColor = .darkGray
        field.borderStyle = .roundedRect
        return field
    }()
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.60) //translucido
        self.frame = UIScreen.main.bounds
        
        self.makeConstrains()
        
        self.cancelBtn.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(dismiss))
        )
        self.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(dismiss))
        )
        
    }
    
    func setupStack(views: [UIView]) {
        for view in views {
            self.stack.addArrangedSubview(view)
        }
    }
    
    private func makeConstrains() {
        self.addSubview(container)
        self.container.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        self.title.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(34)
        }
        
        self.viewSubTitle.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(40)
        }
        
        self.viewSubTitle.addSubview(subTitle)
        self.subTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
            make.width.equalToSuperview()
        }
        
        self.confirmBtn.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        
        self.cancelBtn.snp.makeConstraints { (make) in
            make.height.equalTo(30)
        }
        
        self.field.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(34)
        }
        
        self.container.addSubview(stack)
        self.stack.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(24)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismiss() {
        self.removeFromSuperview()
    }
    
}

// MARK: - AddActions for button (como um observable)
@objc class ClosureSleeve: NSObject {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
