//
//  ViewController.swift
//  GradientView
//
//  Created by sunny_junne on 03.05.2023.
//

import UIKit

class ViewController: UIViewController {

    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let firstColor: CGColor = UIColor.purple.cgColor
        static let secondColor: CGColor = UIColor.green.cgColor
        static let shadowColor: CGColor = UIColor.black.cgColor
        static let shadowFillColor: CGColor = UIColor.white.cgColor
        static let shadowOpacity: Float = 0.8
        static let shadowCornerRadius: CGFloat = 5
    }

    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        gradientView.layer.cornerRadius = Constants.cornerRadius
        setupGradient()
        setupShadow()
    }
    
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [Constants.firstColor, Constants.secondColor]
        gradientLayer.cornerRadius = Constants.cornerRadius
        gradientView.layer.addSublayer(gradientLayer)
    }

    func setupShadow() {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: gradientView.bounds, cornerRadius: Constants.cornerRadius).cgPath
        shadowLayer.fillColor = Constants.shadowFillColor
        shadowLayer.shadowColor = Constants.shadowColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = Constants.shadowOpacity
        shadowLayer.shadowRadius = Constants.shadowCornerRadius
        gradientView.layer.insertSublayer(shadowLayer, at: 0)
    }

}

