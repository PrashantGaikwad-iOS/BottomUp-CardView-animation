//
//  ViewController.swift
//  BottomUp CardView
//
//  Created by Prashant G on 10/24/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cardView        = UIView()
    let videoImageView  = UIImageView()
    let animateButton   = UIButton()
    let closeButton     = UIButton()
    
    var cardViewBottomConstraint : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .black
        
        setupCardView()
        setupAnimateButton()
        setupVideoImageView()
        setupCloseButton()
    }
    
    func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.backgroundColor = .red
        closeButton.setTitle("Close", for: .normal)
        closeButton.layer.cornerRadius = 12
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        setupCloseButtonConstraints()
    }
    
    func setupCloseButtonConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -30).isActive = true
        
    }

    @objc func closeButtonAction() {
        cardViewBottomConstraint.constant = 600
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func setupCardView() {
        view.addSubview(cardView)
        cardView.backgroundColor = .yellow
        cardView.layer.cornerRadius = 12

        setupCardViewConstraints()
    }

    func setupVideoImageView() {
        cardView.addSubview(videoImageView)
        videoImageView.layer.cornerRadius = 12
        videoImageView.layer.masksToBounds = true
        videoImageView.image = UIImage(named: "mumbai.jpg")
        
        setupVideoImageViewConstraints()
    }
    
    func setupVideoImageViewConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        videoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10).isActive = true
        videoImageView.heightAnchor.constraint(equalTo: videoImageView.widthAnchor, multiplier: 9.0/16.0).isActive = true
        videoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10).isActive = true
    }
    
    func setupCardViewConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        
        cardViewBottomConstraint = cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        cardViewBottomConstraint.isActive = true
    }
    
    func setupAnimateButton() {
        view.addSubview(animateButton)
        animateButton.setTitle("Animate", for: .normal)
        animateButton.setTitleColor(.white, for: .normal)
        animateButton.backgroundColor    = .blue
        animateButton.layer.cornerRadius = 12
        animateButton.addTarget(self, action: #selector(animateCard), for: .touchUpInside)
        
        setAnimateButtonConstraints()
    }

    func setAnimateButtonConstraints() {
        animateButton.translatesAutoresizingMaskIntoConstraints = false
        animateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        animateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        animateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animateButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    @objc func animateCard() {
        cardViewBottomConstraint.constant = -50
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}

