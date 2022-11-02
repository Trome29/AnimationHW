//
//  Animation.swift
//  Homework 3.01
//
//  Created by Roman on 01.11.2022.
//

struct Animation {
    
    let animation: String
    let curve: String

    static func getAnimations() -> [Animation] {
        
        var animationList: [Animation] = []
        let animations = AnimationsData.shared.animations
        let curves = AnimationsData.shared.curves
        
        let iterationCount = min(animations.count, curves.count)
        
        for index in 0..<iterationCount {
            let animation = Animation(animation: animations[index], curve: curves[index])
            animationList.append(animation)
        }
        return animationList
    }

}
