//
//  OrganAPI.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 16/03/25.
//

import Foundation

struct Organ {
    let title: String
    let imageName: String
    let shortDescription: String
    let longDescription: String
    let diseases: [(name: String, cure: String)]
}

class OrganAPI {
    static let shared = OrganAPI()
    
    private init() {}

    func getOrgans() -> [Organ] {
        return [
            Organ(
                title: "Brain",
                imageName: "brain",
                shortDescription: "Controls body functions and processes information.",
                longDescription: "The brain is the central organ of the nervous system, responsible for cognition, emotions, and motor functions. It processes sensory input, controls body movements, and enables learning and memory storage.",
                diseases: [
                    ("Alzheimer’s", "Medications & Cognitive Therapy"),
                    ("Parkinson’s", "Dopamine Boosters & Physiotherapy"),
                    ("Stroke", "Blood Thinners & Rehabilitation"),
                    ("Epilepsy", "Anti-seizure Medications"),
                    ("Brain Tumor", "Surgery & Radiation Therapy"),
                    ("Migraine", "Pain Relievers & Lifestyle Management"),
                    ("Meningitis", "Antibiotics & Hospitalization"),
                    ("Multiple Sclerosis", "Immunotherapy & Physiotherapy"),
                    ("Encephalitis", "Antiviral Medications"),
                    ("Traumatic Brain Injury", "Surgery & Rehab"),
                    ("Hydrocephalus", "Surgical Shunt Insertion"),
                    ("Cerebral Palsy", "Therapies & Assistive Devices"),
                    ("Dementia", "Medications & Care Support"),
                    ("Aneurysm", "Surgical Clipping or Coiling"),
                    ("Huntington’s Disease", "Symptom Management")
                ]
            ),
            Organ(
                title: "Heart",
                imageName: "heart",
                shortDescription: "Pumps blood and oxygen throughout the body.",
                longDescription: "The heart is a muscular organ that pumps blood through the circulatory system. It supplies oxygen and nutrients to tissues and removes carbon dioxide and waste products, ensuring proper body function.",
                diseases: [
                    ("Heart Attack", "Aspirin & Angioplasty"),
                    ("Arrhythmia", "Medications & Pacemakers"),
                    ("Hypertension", "Lifestyle Changes & Beta Blockers"),
                    ("Congestive Heart Failure", "Diuretics & Lifestyle Changes"),
                    ("Cardiomyopathy", "Medication & Heart Transplant"),
                    ("Atherosclerosis", "Statins & Bypass Surgery"),
                    ("Angina", "Nitrates & Lifestyle Changes"),
                    ("Heart Valve Disease", "Valve Replacement Surgery"),
                    ("Endocarditis", "Antibiotics or Surgery"),
                    ("Myocarditis", "Rest & Anti-inflammatory Drugs"),
                    ("Pericarditis", "Pain Relievers & Anti-inflammatory Drugs"),
                    ("Atrial Fibrillation", "Blood Thinners & Ablation"),
                    ("Tachycardia", "Beta Blockers or Catheter Ablation"),
                    ("Bradycardia", "Pacemaker Implantation"),
                    ("Coronary Artery Disease", "Statins & Angioplasty")
                ]
            ),
            Organ(
                title: "Lungs",
                imageName: "lungs",
                shortDescription: "Enables breathing and oxygen exchange.",
                longDescription: "The lungs are responsible for gas exchange, allowing oxygen to enter the bloodstream and expelling carbon dioxide. They work with the respiratory system to support metabolism and maintain oxygen levels.",
                diseases: [
                    ("Asthma", "Inhalers & Bronchodilators"),
                    ("Pneumonia", "Antibiotics & Rest"),
                    ("COPD", "Oxygen Therapy & Medications"),
                    ("Lung Cancer", "Chemotherapy & Surgery"),
                    ("Pulmonary Embolism", "Anticoagulants & Thrombolytics"),
                    ("Tuberculosis", "Antibiotic Therapy"),
                    ("Bronchitis", "Cough Medications & Rest"),
                    ("Cystic Fibrosis", "Airway Clearance & Enzyme Therapy"),
                    ("Sleep Apnea", "CPAP Machines"),
                    ("Pleurisy", "Pain Relief & Treating Infection"),
                    ("Pulmonary Hypertension", "Vasodilators & Oxygen Therapy"),
                    ("Silicosis", "Avoid Exposure & Bronchodilators"),
                    ("Emphysema", "Bronchodilators & Oxygen Therapy"),
                    ("Respiratory Syncytial Virus", "Supportive Therapy"),
                    ("Asbestosis", "Symptom Management")
                ]
            ),
            Organ(
                title: "Pancreas",
                imageName: "pancreas",
                shortDescription: "Regulates blood sugar and aids digestion.",
                longDescription: "The pancreas is an essential organ that produces insulin to regulate blood sugar and enzymes that help digest food. It plays a vital role in metabolism and maintaining energy balance.",
                diseases: [
                    ("Diabetes Type 1", "Insulin Therapy"),
                    ("Diabetes Type 2", "Oral Medications & Lifestyle Changes"),
                    ("Pancreatitis", "IV Fluids & Pain Relief"),
                    ("Pancreatic Cancer", "Surgery & Chemotherapy"),
                    ("Cystic Fibrosis", "Enzyme Therapy & Respiratory Care"),
                    ("Islet Cell Tumors", "Surgery & Medication"),
                    ("Pancreatic Insufficiency", "Enzyme Supplements"),
                    ("Hypoglycemia", "Glucose Tablets & Diet Changes"),
                    ("Hyperglycemia", "Insulin Adjustment"),
                    ("Pancreatic Abscess", "Drainage & Antibiotics"),
                    ("Pancreatic Pseudocyst", "Observation or Drainage"),
                    ("Pancreatic Necrosis", "Surgical Debridement"),
                    ("Hereditary Pancreatitis", "Pain Control & Surgery"),
                    ("Insulinoma", "Surgery"),
                    ("Glucagonoma", "Surgery & Medications")
                ]
            ),
            Organ(
                title: "Kidney",
                imageName: "kidney",
                shortDescription: "Filters waste and balances body fluids.",
                longDescription: "The kidneys filter blood, remove waste, and regulate electrolyte balance. They also help control blood pressure and produce hormones essential for red blood cell production.",
                diseases: [
                    ("Kidney Stones", "Hydration & Surgery"),
                    ("Chronic Kidney Disease", "Dialysis & Transplant"),
                    ("UTI", "Antibiotics & Increased Fluids"),
                    ("Glomerulonephritis", "Steroids & BP Meds"),
                    ("Polycystic Kidney Disease", "Pain Relief & Dialysis"),
                    ("Nephrotic Syndrome", "Steroids & Diuretics"),
                    ("Kidney Cancer", "Surgery & Immunotherapy"),
                    ("Acute Kidney Injury", "Dialysis & Fluid Management"),
                    ("Hydronephrosis", "Stent or Surgery"),
                    ("Renal Artery Stenosis", "Angioplasty or Surgery"),
                    ("Pyelonephritis", "IV Antibiotics"),
                    ("Renal Failure", "Dialysis & Kidney Transplant"),
                    ("Hematuria", "Treat Underlying Cause"),
                    ("Diabetic Nephropathy", "Glycemic Control"),
                    ("Interstitial Nephritis", "Stop Offending Drugs")
                ]
            ),
            Organ(
                title: "Intestines",
                imageName: "intestines",
                shortDescription: "Absorbs nutrients and eliminates waste.",
                longDescription: "The intestines are responsible for digesting food, absorbing nutrients, and eliminating waste. They contain beneficial bacteria that support digestion and overall health.",
                diseases: [
                    ("IBS", "Diet Control & Probiotics"),
                    ("Crohn’s Disease", "Anti-inflammatory Drugs"),
                    ("Colon Cancer", "Chemotherapy & Surgery"),
                    ("Celiac Disease", "Gluten-Free Diet"),
                    ("Diverticulitis", "Antibiotics & Dietary Changes"),
                    ("Intestinal Obstruction", "Surgery & Bowel Rest"),
                    ("Ulcerative Colitis", "Anti-inflammatory Drugs"),
                    ("Colitis", "Antibiotics & Anti-diarrheals"),
                    ("Appendicitis", "Surgical Removal"),
                    ("Hernia", "Surgery"),
                    ("Gastroenteritis", "Hydration & Rest"),
                    ("Small Intestinal Bacterial Overgrowth", "Antibiotics"),
                    ("Intestinal Perforation", "Emergency Surgery"),
                    ("Hemorrhoids", "Creams & Surgery"),
                    ("Meckel's Diverticulum", "Surgical Removal")
                ]
            )
        ]
    }
}
