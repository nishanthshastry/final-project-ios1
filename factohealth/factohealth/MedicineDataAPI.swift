//
//  MedicineDataAPI.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 16/03/25.
//

import Foundation

struct Medicine {
    let name: String
    let purpose: String
}

class MedicineDataAPI {
    static let shared = MedicineDataAPI()

    private let medicineDetails: [String: Medicine] = [
        "Alaxan": Medicine(name: "Alaxan", purpose: "Pain reliever for headaches and muscle pain."),
        "Bactidol": Medicine(name: "Bactidol", purpose: "Antiseptic mouthwash for sore throat."),
        "Bioflu": Medicine(name: "Bioflu", purpose: "Cold and flu relief."),
        "Biogesic": Medicine(name: "Biogesic", purpose: "Fever and pain relief."),
        "DayZinc": Medicine(name: "DayZinc", purpose: "Boosts immunity with zinc and vitamin C."),
        "Decolgen": Medicine(name: "Decolgen", purpose: "Relieves colds, flu, and nasal congestion."),
        "Fish Oil": Medicine(name: "Fish Oil", purpose: "Supports heart health and brain function."),
        "Kremil S": Medicine(name: "Kremil S", purpose: "Antacid for acid reflux and indigestion."),
        "Medicol": Medicine(name: "Medicol", purpose: "Pain reliever for headaches and body pain."),
        "Neozep": Medicine(name: "Neozep", purpose: "Cold and flu relief with decongestant.")
    ]

    func getMedicineInfo(for label: String) -> Medicine? {
        return medicineDetails[label]
    }
}
