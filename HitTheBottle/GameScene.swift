//
//  GameScene.swift
//  HitTheBottle
//
//  Created by Mustafa Pekdemir on 25.01.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var cannon = SKSpriteNode()
    var background = SKSpriteNode()
    var bottle = SKSpriteNode()
    var bottle2 = SKSpriteNode()
    var bottle3 = SKSpriteNode()
    var bottle4 = SKSpriteNode()
    var bottle5 = SKSpriteNode()
    var bottle6 = SKSpriteNode()
    var bottle7 = SKSpriteNode()
    var bottle8 = SKSpriteNode()
    var bottle9 = SKSpriteNode()
    
    
    var gameStarted = false
    var originalPosition: CGPoint?
    var bottlePosition: CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    var playerName = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Cannon = 1
        case Bottle = 2
    }
    
    override func didMove(to view: SKView) {
    
        // Fiziksel Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        //Topatar
        
        cannon = childNode(withName: "cannonball") as! SKSpriteNode
        
        let cannonTexture = SKTexture(imageNamed: "cannonball")
        
        cannon.physicsBody = SKPhysicsBody(circleOfRadius: cannonTexture.size().height / 3)
        cannon.physicsBody?.affectedByGravity = false
        cannon.physicsBody?.isDynamic = true
        cannon.physicsBody?.mass = 0.10
        originalPosition = cannon.position
        
        cannon.physicsBody?.contactTestBitMask = ColliderType.Cannon.rawValue
        cannon.physicsBody?.categoryBitMask = ColliderType.Cannon.rawValue
        cannon.physicsBody?.collisionBitMask = ColliderType.Bottle.rawValue
        
        //Şişeler
        
        let bottleTexture = SKTexture(imageNamed: "poisonbottle")
        let size = CGSize(width: bottleTexture.size().width * 0.7, height: bottleTexture.size().height * 0.7)
                                      
        
        bottle = childNode(withName: "bottle") as! SKSpriteNode
        bottle.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle.physicsBody?.isDynamic = true
        bottle.physicsBody?.affectedByGravity = true
        bottle.physicsBody?.allowsRotation = true
        bottle.physicsBody?.mass = 0.1
        
        
        bottle.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle2 = childNode(withName: "bottle2") as! SKSpriteNode
        bottle2.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle2.physicsBody?.isDynamic = true
        bottle2.physicsBody?.affectedByGravity = true
        bottle2.physicsBody?.allowsRotation = true
        bottle2.physicsBody?.mass = 0.1
        
        
        bottle2.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle3 = childNode(withName: "bottle3") as! SKSpriteNode
        bottle3.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle3.physicsBody?.isDynamic = true
        bottle3.physicsBody?.affectedByGravity = true
        bottle3.physicsBody?.allowsRotation = true
        bottle3.physicsBody?.mass = 0.1
        
        
        bottle3.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle4 = childNode(withName: "bottle4") as! SKSpriteNode
        bottle4.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle4.physicsBody?.isDynamic = true
        bottle4.physicsBody?.affectedByGravity = true
        bottle4.physicsBody?.allowsRotation = true
        bottle4.physicsBody?.mass = 0.1
        
        
        bottle4.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle5 = childNode(withName: "bottle5") as! SKSpriteNode
        bottle5.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle5.physicsBody?.isDynamic = true
        bottle5.physicsBody?.affectedByGravity = true
        bottle5.physicsBody?.allowsRotation = true
        bottle5.physicsBody?.mass = 0.1
        
        
        bottle5.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle6 = childNode(withName: "bottle6") as! SKSpriteNode
        bottle6.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle6.physicsBody?.isDynamic = true
        bottle6.physicsBody?.affectedByGravity = true
        bottle6.physicsBody?.allowsRotation = true
        bottle6.physicsBody?.mass = 0.1
        
        
        bottle6.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle7 = childNode(withName: "bottle7") as! SKSpriteNode
        bottle7.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle7.physicsBody?.isDynamic = true
        bottle7.physicsBody?.affectedByGravity = true
        bottle7.physicsBody?.allowsRotation = true
        bottle7.physicsBody?.mass = 0.1
        
        
        bottle7.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle8 = childNode(withName: "bottle8") as! SKSpriteNode
        bottle8.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle8.physicsBody?.isDynamic = true
        bottle8.physicsBody?.affectedByGravity = true
        bottle8.physicsBody?.allowsRotation = true
        bottle8.physicsBody?.mass = 0.1
        
        
        bottle8.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        bottle9 = childNode(withName: "bottle9") as! SKSpriteNode
        bottle9.physicsBody = SKPhysicsBody(rectangleOf: size)
        bottle9.physicsBody?.isDynamic = true
        bottle9.physicsBody?.affectedByGravity = true
        bottle9.physicsBody?.allowsRotation = true
        bottle9.physicsBody?.mass = 0.1
        
        
        bottle9.physicsBody?.collisionBitMask = ColliderType.Cannon.rawValue
        
        //Label
        
        playerName.fontName = "Helvetica"
        playerName.fontSize = 40
        playerName.text = "fischerweise"
        playerName.fontColor = .red
        playerName.position = CGPoint(x: 0, y: self.frame.height / 3)
        playerName.zPosition = 3
        self.addChild(playerName)
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 30
        scoreLabel.text = "0"
        scoreLabel.fontColor = .blue
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.Cannon.rawValue || contact.bodyB.collisionBitMask == ColliderType.Cannon.rawValue {
            
            score += 1
            scoreLabel.text = String(score)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
     
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == cannon {
                                cannon.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == cannon {
                                cannon.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == cannon {
                                
                               let dx = -(touchLocation.x - originalPosition!.x)
                               let dy = -(touchLocation.y - originalPosition!.y)
                                
                               let impulse = CGVector(dx: dx, dy: dy)
                                
                                cannon.physicsBody?.applyImpulse(impulse)
                                cannon.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let cannonPhysicsBody = cannon.physicsBody {
            if cannonPhysicsBody.velocity.dx <= 0.1 && cannonPhysicsBody.velocity.dy <= 0.1 && cannonPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                cannon.physicsBody?.affectedByGravity = false
                cannon.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                cannon.physicsBody?.angularVelocity = 0
                cannon.position = originalPosition!
                
                score = 0
                scoreLabel.text = String(score)
                gameStarted = false
            }
        }
    }
}

