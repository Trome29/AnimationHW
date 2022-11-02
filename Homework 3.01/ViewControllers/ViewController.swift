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
    @IBOutlet var codeTextView: SpringTextView!
    @IBOutlet var runButton: SpringButton!
    
    // MARK: - Private properties
    private var isBall = false
    private var selectedAnimation = ""
    private var selectedCurve = ""
    private var selectedForce: CGFloat = 0
    private var selectedDuration: CGFloat = 0
    private let selectedDelay: CGFloat = 0.3
    private let animation = Animation.getAnimations()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedValues()
        
        codeTextView.text += "preset: \"\(selectedAnimation)\"\n"
        getSetupTextView()
    }
    
    override func viewWillLayoutSubviews() {
        codeTextView.centerVertically()
    }

    // MARK: - IBOutlets
    @IBAction func shapeButtonPressed(_ sender: AnyObject) {
        changeBall()
    }
    @IBAction func runButtonPressed(_ sender: SpringButton) {
        codeTextView.text = ""
        getAnimate()
        codeTextView.text += "preset: \"\(codeTextView.animation)\"\n"
        getSetupTextView()
        runButton.setTitle("Run \(selectedAnimation)", for: .normal)
    }
}

// MARK: - Private methods
extension ViewController {
    
    private func selectedValues() {
        selectedAnimation = animation.randomElement()?.animation ?? ""
        selectedCurve = animation.randomElement()?.curve ?? ""
        selectedForce = CGFloat.random(in: 1.3...2)
        selectedDuration = CGFloat.random(in: 1.2...2)
    }
    
    private func getOptions() {
        selectedValues()
        
        codeTextView.force = selectedForce
        codeTextView.duration = selectedDuration
        codeTextView.delay = selectedDelay
    }
    
    private func getSetupTextView() {
        codeTextView.text += "curve: \"\(selectedCurve)\"\n"
        codeTextView.text += String(format: "force:  %.1f\n", Double(selectedForce))
        codeTextView.text += String(format: "duration:  %.1f\n", Double(selectedDuration))
        codeTextView.text += String(format: "delay:  %.1f\n", Double(selectedDelay))
    }
    
    private func getAnimate() {
        codeTextView.animation = selectedAnimation
        getOptions()
        codeTextView.animate()
    }
    
    private func changeBall() {
        isBall.toggle()
        let animation = CABasicAnimation()
        let halfWidth = codeTextView.frame.width / 2
        let cornerRadius: CGFloat = isBall ? halfWidth : 10
        animation.keyPath = "cornerRadius"
        animation.fromValue = isBall ? 10 : halfWidth
        animation.toValue = cornerRadius
        animation.duration = 0.2
        codeTextView.layer.cornerRadius = cornerRadius
        codeTextView.layer.add(animation, forKey: "radius")
    }
}

// MARK: - UITextView
extension UITextView {
    public func centerVertically() {
        let iFont = font == nil ? UIFont.systemFont(ofSize: UIFont.systemFontSize) : font!
        textContainerInset.top = ((frame.height - iFont.lineHeight) / 2) / 2
    }
}
