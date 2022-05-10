//
//  LikeViewController.swift
//  LottieInteractionsExamples
//
//  Created by Evandro Harrison Hoffmann on 10/05/2022.
//

import UIKit
import Lottie

class LikeViewController: UIViewController {
    
    private lazy var animationView: AnimationView = {
        let animationView = AnimationView(animation: Animation.named("likeAnimation")!)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 2
        animationView.contentMode = .scaleAspectFit
        return animationView
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
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleLike))
        animationView.addGestureRecognizer(tapGesture)
    }
    
    var isLiked: Bool = false
    @objc func toggleLike() {
        isLiked = !isLiked
        
        if isLiked {
            animationView.play(fromProgress: 0, toProgress: 0.5, loopMode: .playOnce)
        } else {
            animationView.play(fromProgress: 0.5, toProgress: 1, loopMode: .playOnce)
        }
    }
}


