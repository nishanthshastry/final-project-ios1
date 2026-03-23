//
//  KYOViewController.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 26/02/25.
//

import UIKit

class KYOViewController: UITableViewController {
    
    let organs = OrganAPI.shared.getOrgans()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UINib(nibName: "OrganCell", bundle: nil), forCellReuseIdentifier: "OrganCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrganCell", for: indexPath) as! OrganCell
        
        let organ = organs[indexPath.row]
        cell.organTitleLabel.text = organ.title
        cell.organDescriptionLabel.text = organ.shortDescription
        cell.organImageView.image = UIImage(named: organ.imageName)
        cell.learnMoreLabel.text = "Learn More >"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOrgan = organs[indexPath.row]
        performSegue(withIdentifier: "showOrganDetails", sender: selectedOrgan)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? OrganViewController, let organ = sender as? Organ {
            destinationVC.organ = organ
        }
    }
}

