//
//  DisplaySetUp.swift
//  PetRescue
//
//  Created by Flo on 29/04/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import UIKit

class ItemSetUp {

    static func textFieldSetUp(_ textField: [UITextField]) {
        for item in textField {
            item.layer.borderWidth = 3
            item.layer.borderColor = Colors.customGreen.cgColor
            item.layer.cornerRadius = item.frame.size.height / 2
            item.borderStyle = .none
        }
    }

    static func buttonsetUp(_ button: UIButton) {
        button.layer.cornerRadius = button.frame.size.height / 2
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.backgroundColor = Colors.customGreen.cgColor
    }
}
