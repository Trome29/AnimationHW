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
    @IBOutlet var codeTextView: SpringTextView! {
        didSet {
            codeTextView.text = animation.description
        }
    }
    @IBOutlet var runButton: SpringButton!
    
    // MARK: - Private properties
    private var isBall = false
    private var animation = Animation.getRandomAnimation()

    // MARK: - View Life Cycle
    override func viewWillLayoutSubviews() {
        codeTextView.centerVertically()
    }

    // MARK: - IBOutlets
    @IBAction func shapeButtonPressed(_ sender: AnyObject) {
        changeBall()
    }
    @IBAction func runButtonPressed(_ sender: SpringButton) {
        codeTextView.text = animation.description
        
        codeTextView.animation = animation.name
        codeTextView.curve = animation.curve
        codeTextView.force = animation.force
        codeTextView.duration = animation.duration
        codeTextView.delay = animation.delay
        codeTextView.animate()
        
        animation = Animation.getRandomAnimation()
        runButton.setTitle("Run \(animation.name)", for: .normal)
    }
}

// MARK: - Private methods
extension ViewController {
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
