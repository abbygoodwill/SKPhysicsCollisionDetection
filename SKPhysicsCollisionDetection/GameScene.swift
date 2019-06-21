//
//  GameScene.swift
//  SKPhysicsCollisionDetection
//
//  Created by Abby Goodwill on 6/21/19.
//  Copyright © 2019 Abby Goodwill. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "player")
    
    // required init
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize) {
        
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        player.size.width = player.size.width / 3.0
        player.size.height = player.size.height / 3.0
        player.position = CGPoint(x: size.width / 2.0, y: 80.0)
        addChild(player)
    }
}
