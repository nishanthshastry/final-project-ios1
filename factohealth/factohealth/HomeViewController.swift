//
//  Home.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 22/02/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var marqueeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        startMarqueeAnimation()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startMarqueeAnimation()
    }

    func startMarqueeAnimation() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = UIScreen.main.bounds.width + marqueeLabel.frame.width / 2
        animation.toValue = -marqueeLabel.frame.width / 2
        animation.duration = 9.0
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        
        marqueeLabel.layer.add(animation, forKey: "marqueeAnimation")
    }
}
