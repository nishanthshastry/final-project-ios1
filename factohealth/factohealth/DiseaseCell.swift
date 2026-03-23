//
//  DiseaseCell.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 16/03/25.
//

import UIKit

class DiseaseCell: UITableViewCell {

    let diseaseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let cureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(diseaseLabel)
        contentView.addSubview(cureLabel)

        NSLayoutConstraint.activate([
            // Disease Label - Left Side
            diseaseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            diseaseLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            diseaseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            diseaseLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -8),

            // Cure Label - Right Side
            cureLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 8),
            cureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cureLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
