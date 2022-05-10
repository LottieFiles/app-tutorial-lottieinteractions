//
//  OpenGiftViewController.swift
//  LottieInteractionsExamples
//
//  Created by Evandro Harrison Hoffmann on 10/05/2022.
//

import UIKit
import Lottie

class OpenGiftViewController: UIViewController {
    
    private var animationView: AnimationView = {
        let animationView = AnimationView(animation: Animation.named("holidaysGiftAnimation"))
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    private var unwrappedLabel: UILabel = {
        let label = UILabel()
        label.text = "Gift unwrapped!"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Open Gift"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        unwrappedLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unwrappedLabel)
        NSLayoutConstraint.activate([
            unwrappedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            unwrappedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            animationView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(unwrapGift))
        animationView.addGestureRecognizer(tapGesture)
    }
    
    private var currentProgress: CGFloat = 0.0
    @objc func unwrapGift() {
        if currentProgress < 0.4 {
            currentProgress += 0.4
            animationView.play(fromProgress: animationView.realtimeAnimationProgress, toProgress: currentProgress)
        } else if !animationView.isAnimationPlaying {
            animationView.play(fromProgress: animationView.realtimeAnimationProgress, toProgress: 1, completion: { [weak self] _ in
                //gift unwrapped
            })
        }
    }
}
