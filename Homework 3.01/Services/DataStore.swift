//
//  AnimationsData.swift
//  Homework 3.01
//
//  Created by Roman on 01.11.2022.
//

import SpringAnimation

class DataStore {
    
    static let shared = DataStore()
    
//    let animations =
//    //let animations: [AnimationPreset] =
//    [
//        "pop",
//        "slideLeft",
//        "slideRight",
//        "slideDown",
//        "slideUp",
//        "squeezeLeft",
//        "squeezeRight",
//        "squeezeDown",
//        "squeezeUp",
//        "fadeIn",
//        "fadeOut",
//        "fadeOutIn",
//        "fadeInLeft",
//        "fadeInRight",
//        "fadeInDown",
//        "fadeInUp",
//        "zoomIn",
//        "fall",
//        "shake",
//        "flipX",
//        "flipY",
//        "morph",
//        "squeeze",
//        "flash",
//        "wobble",
//        "swing"
//    ]
//
//    let curves =
//    [
//        "easeIn",
//        "easeOut",
//        "easeInOut",
//        "linear",
//        "spring",
//        "easeInSine",
//        "easeOutSine",
//        "easeInOutSine",
//        "easeInQuad",
//        "easeOutQuad",
//        "easeInOutQuad",
//        "easeInCubic",
//        "easeOutCubic",
//        "easeInOutCubic",
//        "easeInQuart",
//        "easeOutQuart",
//        "easeInOutQuart",
//        "easeInQuint",
//        "easeOutQuint",
//        "easeInOutQuint",
//        "easeInExpo",
//        "easeOutExpo",
//        "easeInOutExpo",
//        "easeInCirc",
//        "easeOutCirc",
//        "easeInOutCirc",
//        "easeInBack",
//        "easeOutBack",
//        "easeInOutBack"
//    ]
    
    let animations = AnimationPreset.allCases
    let curves = AnimationCurve.allCases
    
    private init() {}
}
