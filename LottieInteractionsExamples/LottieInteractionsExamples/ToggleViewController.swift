//
//  ToggleViewController.swift
//  LottieInteractionsExamples
//
//  Created by Evandro Harrison Hoffmann on 10/05/2022.
//

import UIKit
import Lottie

class ToggleViewController: UIViewController {
    
    private lazy var animatedButton: AnimatedButton = {
        let button = AnimatedButton(animation: Animation.named("toggleAnimation")!)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(toggleAppearance), for: .touchUpInside)
        button.animationSpeed = 2
        button.setPlayRange(fromProgress: 0, toProgress: 0.5, event: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Toggle"
        view.backgroundColor = .white
        
        animatedButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedButton)
        NSLayoutConstraint.activate([
            animatedButton.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            animatedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animatedButton.widthAnchor.constraint(equalToConstant: 126),
            animatedButton.heightAnchor.constraint(equalToConstant: 74)
        ])
    }
    
    @objc func toggleAppearance() {
        animatedButton.isSelected = !animatedButton.isSelected
        
        if animatedButton.isSelected {
            animatedButton.setPlayRange(fromProgress: 0.5, toProgress: 1, event: .touchUpInside)
        } else {
            animatedButton.setPlayRange(fromProgress: 0, toProgress: 0.5, event: .touchUpInside)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0) { [view, animatedButton] in
            view?.backgroundColor = animatedButton.isSelected ? .darkGray : .white
        }
    }
}
