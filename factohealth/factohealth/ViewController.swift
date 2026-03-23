//
//  ViewController.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 21/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bmiImage: UIImageView!
    @IBOutlet weak var knowYourOrgansImage: UIImageView!
    @IBOutlet weak var newspaperImage: UIImageView!
    @IBOutlet weak var researchImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.alpha = 0  // Initially invisible
        
        // Initial positions (off-screen)
        bmiImage.center.x -= view.bounds.width  // Left side
        knowYourOrgansImage.center.x += view.bounds.width  // Right side
        newspaperImage.center.y += view.bounds.height  // Bottom
        researchImage.center.y -= view.bounds.height  // Top
        
        // Start animations after delay
        animateImages()
        animateTitle()
    }
    
    func animateTitle() {
        UIView.animate(withDuration: 1.5, delay: 1.0, options: [.curveEaseIn], animations: {
            self.titleLabel.alpha = 1
        })
    }
    
    func animateImages() {
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.curveEaseOut], animations: {
            self.bmiImage.center.x += self.view.bounds.width
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.6, options: [.curveEaseOut], animations: {
            self.knowYourOrgansImage.center.x -= self.view.bounds.width
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.8, options: [.curveEaseOut], animations: {
            self.newspaperImage.center.y -= self.view.bounds.height
        })
        
        UIView.animate(withDuration: 1.5, delay: 1.0, options: [.curveEaseOut], animations: {
            self.researchImage.center.y += self.view.bounds.height
        }, completion: { _ in
            self.reverseAnimations()  // Call reverse animation before transitioning
            // self.transitionToHomeScreen()  // Call function after animation completes
        })
    }
    
    func reverseAnimations() {
        UIView.animate(withDuration: 1.5, delay: 0.4, options: [.curveEaseIn], animations: {
            self.bmiImage.center.x -= self.view.bounds.width
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.6, options: [.curveEaseIn], animations: {
            self.knowYourOrgansImage.center.x += self.view.bounds.width
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.8, options: [.curveEaseIn], animations: {
            self.newspaperImage.center.y += self.view.bounds.height
        })
        
        UIView.animate(withDuration: 1.5, delay: 1.0, options: [.curveEaseIn], animations: {
            self.researchImage.center.y -= self.view.bounds.height
        })
        
        UIView.animate(withDuration: 1.0, delay: 1.2, options: [.curveEaseIn], animations: {
            self.titleLabel.alpha = 0
        }, completion: { _ in
            self.transitionToHomeScreen()  // Call transition after fade out
        })
    }
    
    func transitionToHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            homeVC.modalTransitionStyle = .crossDissolve  // Smooth transition effect
            homeVC.modalPresentationStyle = .fullScreen  // Full screen transition
            self.present(homeVC, animated: true, completion: nil)
        }
    }
}

