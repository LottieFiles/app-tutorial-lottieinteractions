//
//  ToggleViewController.swift
//  LottieInteractionsExamples
//
//  Created by Evandro Harrison Hoffmann on 10/05/2022.
//

import UIKit
import Lottie

class ToggleViewController: UIViewController {
    
    private lazy var animationView: AnimationView = {
        let animationView = AnimationView(animation: Animation.named("toggleAnimation")!)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 2
        return animationView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Toggle Appearance"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 126),
            animationView.heightAnchor.constraint(equalToConstant: 74)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleAppearance))
        animationView.addGestureRecognizer(tapGesture)
    }
    
    var isDarkMode: Bool = false
    @objc func toggleAppearance() {
        isDarkMode = !isDarkMode
        
        if isDarkMode {
            animationView.play(fromProgress: 0, toProgress: 0.5, loopMode: .playOnce)
        } else {
            animationView.play(fromProgress: 0.5, toProgress: 1, loopMode: .playOnce)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0) { [view, isDarkMode] in
            view?.backgroundColor = isDarkMode ? .darkGray : .white
        }
    }
}
