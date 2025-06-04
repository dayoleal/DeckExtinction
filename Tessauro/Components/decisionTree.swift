import Foundation
import GameplayKit

struct Tree {
    let tree = GKDecisionTree(attribute: "Start" as NSString)
    
    func creation() {
        // Grass or Forest
        let grassScenery = tree.rootNode?.createBranch(value: NSNumber(value: true), attribute: "Grass" as NSString)
        let forestScenery = tree.rootNode?.createBranch(value: NSNumber(value: false), attribute: "Forest" as NSString)
        
        // Alone or Group
        let aloneGrass = grassScenery?.createBranch(value: NSNumber(value: true), attribute: "Alone" as NSString)
        let groupGrass = grassScenery?.createBranch(value: NSNumber(value: false), attribute: "Group" as NSString)
        
        let aloneForest = forestScenery?.createBranch(value: NSNumber(value: true), attribute: "Alone" as NSString)
        let groupForest = forestScenery?.createBranch(value: NSNumber(value: false), attribute: "Group" as NSString)
        
        // Alone Attack
        let attackGrass = aloneGrass?.createBranch(value: NSNumber(value: true), attribute: "Attack" as NSString)
        let runGrass = aloneGrass?.createBranch(value: NSNumber(value: false), attribute: "Run" as NSString)
        
        let attackForest = aloneForest?.createBranch(value: NSNumber(value: true), attribute: "Attack" as NSString)
        let runForest = aloneForest?.createBranch(value: NSNumber(value: false), attribute: "Run" as NSString)

        // Die
        let dieGrass = attackGrass?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
        let dieForest = attackForest?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)

        let resultado = tree.findAction(forAnswers: [
            "Start": NSNumber(value: true),
            "Grass": NSNumber(value: true),
            "Alone": NSNumber(value: true)
        ])
        print(resultado ?? "nada")
    }
    
}

