//
//  LikeViewController.swift
//  LottieInteractionsExamples
//
//  Created by Evandro Harrison Hoffmann on 10/05/2022.
//

import UIKit
import Lottie

class LikeViewController: UIViewController {
    
    private lazy var animatedButton: AnimatedButton = {
        let button = AnimatedButton(animation: Animation.named("likeAnimation")!)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(toggleLike), for: .touchUpInside)
        button.animationSpeed = 2
        button.setPlayRange(fromProgress: 0, toProgress: 0.5, event: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Like"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        animatedButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedButton)
        NSLayoutConstraint.activate([
            animatedButton.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            animatedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animatedButton.widthAnchor.constraint(equalToConstant: 300),
            animatedButton.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func toggleLike() {
        animatedButton.isSelected = !animatedButton.isSelected
        
        if animatedButton.isSelected {
            animatedButton.setPlayRange(fromProgress: 0.5, toProgress: 1, event: .touchUpInside)
        } else {
            animatedButton.setPlayRange(fromProgress: 0, toProgress: 0.5, event: .touchUpInside)
        }
    }
}
