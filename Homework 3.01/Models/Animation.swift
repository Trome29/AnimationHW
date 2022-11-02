//
//  Animation.swift
//  Homework 3.01
//
//  Created by Roman on 01.11.2022.
//

struct Animation {
    
    let animationName: String
    let curveName: String

    static func getAnimations() -> [Animation] {
        
        var animationList: [Animation] = []
        let animationsData = AnimationsData()
        let animations = animationsData.animations
        let curves = animationsData.curves
        
        let iterationCount = min(animations.count, curves.count)
        
        for index in 0..<iterationCount {
            let animation = Animation(animationName: animations[index], curveName: curves[index])
            animationList.append(animation)
        }
        return animationList
    }

}
