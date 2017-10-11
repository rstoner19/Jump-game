//
//  HydrantNode.swift
//  Wag'n Jump
//
//  Created by Rick Stoner on 10/11/17.
//  Copyright © 2017 Rick Stoner. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class HydrantNode: SKSpriteNode {
    
    
    init() {
        let texture = SKTexture(imageNamed: "fireHydrant")
        super.init(texture: texture, color: UIColor.white, size: texture.size())
        self.setupPhysicsBody()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dogAtPostion(position: CGPoint) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.position = position
    }
    
    func animateSpaceDog() {
        let textures: [SKTexture]
        textures = [SKTexture(imageNamed: "dogSample1"), SKTexture(imageNamed: "dogSample2")]
        self.xScale = 0.5
        self.yScale = 0.5
        let animation = SKAction.animate(with: textures, timePerFrame: 0.25)
        let repeatAnimation = SKAction.repeatForever(animation)
        self.run(repeatAnimation)
    }
    
    func setupPhysicsBody() {
        self.physicsBody = SKPhysicsBody.init(rectangleOf: size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        //self.physicsBody?.categoryBitMask = Constants.CollisionCategory.Enemy.rawValue
        self.physicsBody?.collisionBitMask = 0
        // self.physicsBody?.contactTestBitMask = Constants.CollisionCategory.Projectile.rawValue | Constants.CollisionCategory.Ground.rawValue
    }
    
}
