//
//  ViewController.swift
//  Homework 3.01
//
//  Created by Roman on 01.11.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var codeView: SpringTextView!
    @IBOutlet var runButton: SpringButton!
    
    // MARK: - Private properties
    private var isBall = false
    private var animation = Animation.getAnimation()
    private var selectedAnimation = ""
    private var selectedCurve = ""
    private var selectedForce = CGFloat.random(in: 1.3...2)
    private var selectedDuration = CGFloat.random(in: 0.8...2)
    private let selectedDelay: CGFloat = 0.3
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedAnimation = animation.randomElement()?.animationName ?? ""
        selectedCurve = animation.randomElement()?.curveName ?? ""
        
        codeView.text += "\n\n\npreset: \"\(selectedAnimation)\"\n"
        codeView.text += "curve: \"\(selectedCurve)\"\n"
        codeView.text += String(format: "force:  %.1f\n", Double(selectedForce))
        codeView.text += String(format: "duration:  %.1f\n", Double(selectedDuration))
        codeView.text += String(format: "delay:  %.1f\n", Double(selectedDelay))
    }

    // MARK: - IBOutlets
    @IBAction func shapeButtonPressed(_ sender: AnyObject) {
        changeBall()
    }
    @IBAction func runButtonPressed(_ sender: SpringButton) {
        codeView.text = ""
        getAnimate()
        getSetupTextView()
        runButton.setTitle("Run \(selectedAnimation)", for: .normal)
    }
}

// MARK: - Private methods
extension ViewController {
    
    private func changeBall() {
        isBall.toggle()
        let animation = CABasicAnimation()
        let halfWidth = codeView.frame.width / 2
        let cornerRadius: CGFloat = isBall ? halfWidth : 10
        animation.keyPath = "cornerRadius"
        animation.fromValue = isBall ? 10 : halfWidth
        animation.toValue = cornerRadius
        animation.duration = 0.2
        codeView.layer.cornerRadius = cornerRadius
        codeView.layer.add(animation, forKey: "radius")
    }
    
    private func getSetupTextView() {
        selectedAnimation = animation.randomElement()?.animationName ?? ""
        selectedCurve = animation.randomElement()?.curveName ?? ""
        selectedForce = CGFloat.random(in: 1.3...2)
        selectedDuration = CGFloat.random(in: 0.8...2)
        
        codeView.text += "\n\n\npreset: \"\(codeView.animation)\"\n"
        codeView.text += "curve: \"\(selectedCurve)\"\n"
        codeView.text += String(format: "force:  %.1f\n", Double(selectedForce))
        codeView.text += String(format: "duration:  %.1f\n", Double(selectedDuration))
        codeView.text += String(format: "delay:  %.1f\n", Double(selectedDelay))
    }
    
    private func getAnimate() {
        codeView.animation = selectedAnimation
        getSetupTextView()
        codeView.animate()
    }
}
