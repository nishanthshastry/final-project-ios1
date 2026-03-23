//
//  OrganViewController.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 08/03/25.
//

import UIKit

class OrganViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var organTitle: UILabel!
    @IBOutlet weak var organImage: UIImageView!
    @IBOutlet weak var organDescription: UILabel!
    @IBOutlet weak var organDiseases: UITableView!
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    var organ: Organ?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set content
        if let organ = organ {
            organTitle.text = organ.title
            organImage.image = UIImage(named: organ.imageName)
            organDescription.text = organ.longDescription
        }
        
        // Zoom setup
        imageScrollView.delegate = self
        imageScrollView.minimumZoomScale = 1.0
        imageScrollView.maximumZoomScale = 10.0
        centerImageInScrollView()

        // Setup table view
        organDiseases.delegate = self
        organDiseases.dataSource = self
        organDiseases.register(DiseaseCell.self, forCellReuseIdentifier: "DiseaseCell")
        organDiseases.tableFooterView = UIView()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return organImage
    }
    
    func centerImageInScrollView() {
        guard let image = organImage.image else { return }

        let imageViewSize = organImage.frame.size
        let scrollViewSize = imageScrollView.bounds.size

        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0

        imageScrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImageInScrollView()
    }
}

extension OrganViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organ?.diseases.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiseaseCell", for: indexPath) as? DiseaseCell else {
            return UITableViewCell()
        }

        if let disease = organ?.diseases[indexPath.row] {
            cell.diseaseLabel.text = disease.name
            cell.cureLabel.text = disease.cure
        }

        // Zebra striping
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.systemGray6 : UIColor.white

        return cell
    }

    // Table Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray4

        let diseaseHeader = UILabel()
        diseaseHeader.text = "Disease"
        diseaseHeader.font = UIFont.boldSystemFont(ofSize: 16)
        diseaseHeader.textAlignment = .center
        diseaseHeader.translatesAutoresizingMaskIntoConstraints = false

        let cureHeader = UILabel()
        cureHeader.text = "Cure"
        cureHeader.font = UIFont.boldSystemFont(ofSize: 16)
        cureHeader.textAlignment = .center
        cureHeader.translatesAutoresizingMaskIntoConstraints = false

        headerView.addSubview(diseaseHeader)
        headerView.addSubview(cureHeader)

        NSLayoutConstraint.activate([
            diseaseHeader.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            diseaseHeader.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            diseaseHeader.trailingAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -8),

            cureHeader.leadingAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 8),
            cureHeader.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            cureHeader.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

