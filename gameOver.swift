import SpriteKit

class GameOverScene: SKScene {
    var finalScore: Int = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        let gameOverLabel = SKLabelNode(text: "Game Over")
        gameOverLabel.fontName = "Arial"
        gameOverLabel.fontSize = 40
        gameOverLabel.fontColor = .black
        gameOverLabel.position = CGPoint(x: frame.midX, y: frame.midY + 50)
        addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(text: "Score: \(finalScore)")
        scoreLabel.fontName = "Arial"
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = .black
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - 50)
        addChild(scoreLabel)
        
        let restartLabel = SKLabelNode(text: "Tap to Restart")
        restartLabel.fontName = "Arial"
        restartLabel.fontSize = 20
        restartLabel.fontColor = .black
        restartLabel.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        addChild(restartLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: self.size)
        let transition = SKTransition.fade(withDuration: 0.5)
        view?.presentScene(gameScene, transition: transition)
    }
}
