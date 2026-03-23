//
//  MedicineScanViewController.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 26/02/25.
//
    
import UIKit
import CoreML
import Vision

class MedicineScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var mediScan: UIImageView!
    @IBOutlet weak var takePhotoBtn: UIButton!
    @IBOutlet weak var uploadPhotoBtn: UIButton!
    @IBOutlet weak var imgDetailRes: UILabel!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func takePhotoTapped(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true)
        }
    }
    
    @IBAction func uploadPhotoTapped(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true)
        }
    }
    
    // Handle selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            let fixedImage = fixOrientation(image: image)  // Fix orientation before processing
            mediScan.image = fixedImage
            classifyImage(fixedImage)
        }
        dismiss(animated: true, completion: nil)
    }
    
    // Fix image orientation before classification
    func fixOrientation(image: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(image.size)
        image.draw(in: CGRect(origin: .zero, size: image.size))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return normalizedImage ?? image
    }

//    // Classify Image using CoreML Model
//    func classifyImage(_ image: UIImage) {
//        guard let model = try? MedicineImageClassifier(configuration: MLModelConfiguration()).model else {
//            print("Failed to load ML model")
//            return
//        }
//
//        guard let visionModel = try? VNCoreMLModel(for: model) else {
//            print("Failed to create Vision model from CoreML model")
//            return
//        }
//
//        let request = VNCoreMLRequest(model: visionModel) { [weak self] request, error in
//            if let results = request.results as? [VNClassificationObservation],
//               let topResult = results.first {
//                
//                let detectedMedicine = topResult.identifier
//                let confidence = topResult.confidence * 100
//                print("Detected: \(detectedMedicine) with confidence \(confidence)%")  // Debugging
//                
//                DispatchQueue.main.async {
//                    self?.imgDetailRes.text = "Detected: \(detectedMedicine) (\(confidence)%)"
//                    self?.fetchMedicineDetails(for: detectedMedicine)
//                }
//            } else {
//                print("No valid classification result")  // Debugging
//                
//                DispatchQueue.main.async {
//                    self?.imgDetailRes.text = "No medicine detected."
//                }
//            }
//        }
//        
//        guard let ciImage = CIImage(image: image) else {
//            print("Failed to convert UIImage to CIImage")
//            return
//        }
//        
//        let handler = VNImageRequestHandler(ciImage: ciImage)
//        DispatchQueue.global(qos: .userInitiated).async {
//            do {
//                try handler.perform([request])
//            } catch {
//                print("Failed to perform classification: \(error)")
//            }
//        }
//    }
    
    func classifyImage(_ image: UIImage) {
        #if targetEnvironment(simulator)
        // 🔸 SIMULATOR MODE - Mock Classification Result
        print("⚠️ Running on simulator — using mocked classification result.")
        let mockedMedicines = [
            ("Paracetamol", 95.3),
            ("Ibuprofen", 88.7),
            ("Amoxicillin", 91.2),
            ("Cetirizine", 86.5)
        ]
        // Random pick for variety
        let mockResult = mockedMedicines.randomElement()!
        self.imgDetailRes.text = "Detected: \(mockResult.0) (\(String(format: "%.1f", mockResult.1))%)"
        self.fetchMedicineDetails(for: mockResult.0)
        return
        #endif

        // 🔸 REAL DEVICE - Actual CoreML Flow
        let config = MLModelConfiguration()
        config.computeUnits = .cpuOnly  // Optional: helps prevent GPU crash on some real devices too

        guard let model = try? FHMedicineImageClassifier(configuration: config).model else {
            print("Failed to load ML model")
            return
        }

        guard let visionModel = try? VNCoreMLModel(for: model) else {
            print("Failed to create Vision model from CoreML model")
            return
        }

        let request = VNCoreMLRequest(model: visionModel) { [weak self] request, error in
            if let results = request.results as? [VNClassificationObservation],
               let topResult = results.first {
                let detectedMedicine = topResult.identifier
                let confidence = topResult.confidence * 100
                print("✅ Detected: \(detectedMedicine) with confidence \(confidence)%")
                DispatchQueue.main.async {
                    self?.imgDetailRes.text = "Detected: \(detectedMedicine) (\(String(format: "%.1f", confidence))%)"
                    self?.fetchMedicineDetails(for: detectedMedicine)
                }
            } else {
                print("❌ No valid classification result")
                DispatchQueue.main.async {
                    self?.imgDetailRes.text = "No medicine detected."
                }
            }
        }

        guard let ciImage = CIImage(image: image) else {
            print("Failed to convert UIImage to CIImage")
            return
        }

        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                print("❌ Vision request error: \(error.localizedDescription)")
            }
        }
    }
    
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    // Fetch Medicine Details
    func fetchMedicineDetails(for medicineName: String) {
        if let medicine = MedicineDataAPI.shared.getMedicineInfo(for: medicineName) {
            DispatchQueue.main.async {
                self.imgDetailRes.text = """
                Name: \(medicine.name)
                Purpose: \(medicine.purpose)
                """
            }
        } else {
            DispatchQueue.main.async {
                self.imgDetailRes.text = "No details available for \(medicineName)."
            }
        }
    }
}
