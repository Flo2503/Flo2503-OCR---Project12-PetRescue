//
//  LogInViewController.swift
//  PetRescue
//
//  Created by Flo on 24/04/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var connexionButton: UIButton!
    @IBOutlet weak var inscriptionButton: UIButton!
    @IBOutlet weak var buttonView: UIStackView!

    // MARK: - Actions
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) { }

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadius([connexionButton, inscriptionButton])
        border()
        inscriptionButton.layer.backgroundColor = Colors.customGreen.cgColor
        view.setGradientBackground(colorOne: Colors.lightBrown, colotTwo: Colors.customGreen)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - Extension
extension LogInViewController {

    private func cornerRadius(_ buttons: [UIButton]) {
        for element in buttons {
            element.layer.cornerRadius = element.frame.size.height / 2
        }
    }

    private func border() {
        inscriptionButton.layer.borderWidth = 2
        connexionButton.layer.borderWidth = 2
        inscriptionButton.layer.borderColor = UIColor.white.cgColor
        connexionButton.layer.borderColor = Colors.customGreen.cgColor
    }
}
