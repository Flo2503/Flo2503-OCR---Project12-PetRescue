//
//  MyAdTableViewCell.swift
//  PetRescue
//
//  Created by Flo on 21/05/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class MyAdTableViewCell: UITableViewCell {

    @IBOutlet weak var animalPicture: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animlalLocality: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(name: String, locality: String) {
        animalName.text = name
        animlalLocality.text = locality
    }

    func configureImage(image: UIImage) {
        animalPicture.image = image
        self.animalPicture.layer.cornerRadius = self.animalPicture.frame.size.width / 2
        self.animalPicture.clipsToBounds = true
    }

}
