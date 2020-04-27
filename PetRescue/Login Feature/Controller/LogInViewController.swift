//
//  LogInViewController.swift
//  PetRescue
//
//  Created by Flo on 24/04/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var connexionButton: UIButton!
    @IBOutlet weak var inscriptionButton: UIButton!
    @IBOutlet weak var buttonView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadius([connexionButton, inscriptionButton])
        border()
        view.setGradientBackground(colorOne: Colors.lightBrown, colotTwo: Colors.lightGreen)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    private func cornerRadius(_ buttons: [UIButton]) {
        for element in buttons {
            element.layer.cornerRadius = 22
        }
    }

    private func border() {
        inscriptionButton.layer.borderWidth = 3
        connexionButton.layer.borderWidth = 3
        inscriptionButton.layer.borderColor = UIColor.white.cgColor
        connexionButton.layer.borderColor = Colors.lightGreen.cgColor
    }
}
