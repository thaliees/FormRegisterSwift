//
//  UIViewExtension.swift
//  FormRegister
//
//  Created by Thaliees on 9/28/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

extension UIView {
    func addLineBottom(width:Double) {
        let line = UIView()
        line.backgroundColor = UIColor.gray
        line.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(line)
        
        let metric = ["width": NSNumber(value: width)]
        let view = ["line": line]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[line]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: metric, views: view))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(width)]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: metric, views: view))
    }
}
