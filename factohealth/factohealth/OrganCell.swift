//
//  OrganCell.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 11/03/25.
//

import UIKit

class OrganCell: UITableViewCell {
    
    @IBOutlet weak var organImageView: UIImageView!
    @IBOutlet weak var organTitleLabel: UILabel!
    @IBOutlet weak var organDescriptionLabel: UILabel!
    @IBOutlet weak var learnMoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        organImageView.contentMode = .scaleAspectFit
        learnMoreLabel.textColor = .systemBlue
    }
}

