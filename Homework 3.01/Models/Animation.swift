//
//  Animation.swift
//  Homework 3.01
//
//  Created by Roman on 01.11.2022.
//

struct Animation {
    
    let animationName: String
    let curveName: String

    static func getAnimation() -> [Animation] {
        
        var animationList: [Animation] = []
        
        let animations = AnimationsData().animations
        let curves = AnimationsData().curves
        
        let iterationCount = min(animations.count, curves.count)
        
        for index in 0..<iterationCount {
            let animation = Animation(animationName: animations[index], curveName: curves[index])
            animationList.append(animation)
        }
        return animationList
    }

}
