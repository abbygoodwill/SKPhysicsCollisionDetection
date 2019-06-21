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
    let coin = SKSpriteNode(imageNamed: "coin")
    
    // required init
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func touchDown(atPoint pos: CGPoint) {
        
        let xPoint = pos.x
        
        if xPoint > player.position.x {
            player.physicsBody?.applyImpulse(CGVector(dx: 5.0, dy: 0.0))
        } else if xPoint < player.position.x {
            player.physicsBody?.applyImpulse(CGVector(dx: -5.0, dy: 0.0))
        }
    }
    
    override init(size:CGSize) {
        
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        player.size.width = player.size.width / 3.0
        player.size.height = player.size.height / 3.0
        player.position = CGPoint(x: size.width / 2.0, y: 80.0)
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2.0)
        player.physicsBody?.isDynamic = true
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.allowsRotation = false
        addChild(player)
        
        coin.position = CGPoint(x: size.width / 4.0, y: 450.0)
        coin.physicsBody = SKPhysicsBody(circleOfRadius: coin.size.width / 2.0)
        coin.physicsBody?.isDynamic = true
        coin.physicsBody?.affectedByGravity = true
        addChild(coin)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            self.touchDown(atPoint: t.location(in:self))
            break
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("CONTACT! OH MY GOSH! THERE'S CONTACT!")
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
}
