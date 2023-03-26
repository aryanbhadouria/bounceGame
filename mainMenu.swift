import SpriteKit

class MainMenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        let startGameLabel = SKLabelNode(text: "Tap to Start")
        startGameLabel.fontName = "Arial"
        startGameLabel.fontSize = 40
        startGameLabel.fontColor = .black
        startGameLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(startGameLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: self.size)
        let transition = SKTransition.fade(withDuration: 0.5)
        view?.presentScene(gameScene, transition: transition)
    }
}
