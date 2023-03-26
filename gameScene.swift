import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball: SKShapeNode!
    var paddle: SKShapeNode!
    var score = 0
    var level = 1
    var bounces = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        //Physics
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        physicsWorld.contactDelegate = self
        
        //Ball node
        ball = SKShapeNode(circleOfRadius: 15)
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
        ball.fillColor = .red
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody?.restitution = 1.0
        ball.physicsBody?.friction = 0
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
        ball.physicsBody?.categoryBitMask = 1
        ball.physicsBody?.collisionBitMask = 2
        ball.physicsBody?.contactTestBitMask = 2
        
        //Paddle node
        paddle = SKShapeNode(rectOf: CGSize(width: 100, height: 15))
        paddle.position = CGPoint(x: frame.midX, y: 50)
        paddle.fillColor = .blue
        paddle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 15))
        paddle.physicsBody?.isDynamic = false
        paddle.physicsBody?.restitution = 1.0
        paddle.physicsBody?.friction = 0
        paddle.physicsBody?.categoryBitMask = 2
        
        addChild(ball)
        addChild(paddle)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            paddle.position.x = position.x
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            paddle.position.x = position.x
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node == ball && contact.bodyB.node == paddle || contact.bodyA.node == paddle && contact.bodyB.node == ball {
            bounces += 1
            if bounces >= level * 2 {
                bounces = 0
                level += 1
                score += level * 10
                print("Level: \(level), Score: \(score)")
            }
        }
    }
}
