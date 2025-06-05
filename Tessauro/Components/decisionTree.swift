import Foundation
import GameplayKit

struct Tree {
    var decision1: Bool
    var decision2: Bool
    var decision3: Bool
    var decision4: Bool
    var decision5: Bool
    
    
    init(_ decision1: Bool, _ decision2: Bool, _ decision3: Bool, _ decision4: Bool, _ decision5: Bool) {
        self.decision1 = decision1
        self.decision2 = decision2
        self.decision3 = decision3
        self.decision4 = decision4
        self.decision5 = decision5
    }
    
    func creation() {
        let tree = GKDecisionTree(attribute: "Start" as NSString)
        
        var die: Bool = false
        var win: Bool = false
        
        // Grass or Forest
        let grassScenery = tree.rootNode?.createBranch(value: NSNumber(value: true), attribute: "Grass" as NSString)
        let forestScenery = tree.rootNode?.createBranch(value: NSNumber(value: false), attribute: "Forest" as NSString)
        
        let resultado1 = tree.findAction(forAnswers: [
            "Start": NSNumber(value: decision1)
        ])
//        print(decision1)
        print(resultado1 ?? "1 não deu certo")

        
        if decision1 {
            // Alone or Group
            let alone = grassScenery?.createBranch(value: NSNumber(value: true), attribute: "Alone" as NSString)
            let group = grassScenery?.createBranch(value: NSNumber(value: false), attribute: "Group" as NSString)
            
            let resultado2 = tree.findAction(forAnswers: [
                "Start": NSNumber(value: true),
                "Grass": NSNumber(value: decision2)
            ])
//            print(decision2)
            print(resultado2 ?? "2 não deu certo")

            
            if decision2 {
                let attack = alone?.createBranch(value: NSNumber(value: true), attribute: "Attack" as NSString)
                let run = alone?.createBranch(value: NSNumber(value: false), attribute: "Run" as NSString)
                
                let resultado3 = tree.findAction(forAnswers: [
                    "Start": NSNumber(value: true),
                    "Grass": NSNumber(value: true),
                    "Alone": NSNumber(value: decision3)
                ])
                print(resultado3 ?? "3 não deu certo")

                if decision3 {
                    let die = attack?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                    let die2 = attack?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                } else {
                    let mud = run?.createBranch(value: NSNumber(value: true), attribute: "Mud" as NSString)
                    let shelter = run?.createBranch(value: NSNumber(value: false), attribute: "Shelter" as NSString)
                    
                    let resultado4 = tree.findAction(forAnswers: [
                        "Start": NSNumber(value: true),
                        "Grass": NSNumber(value: true),
                        "Alone": NSNumber(value: false),
                        "Run": NSNumber(value: decision4)
                    ])
//                    print(decision4)
                    print(resultado4 ?? "4 não deu certo")
                    
                    if decision4 {
                        let die3 = mud?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                        let die4 = mud?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                    } else {
                        let egg = shelter?.createBranch(value: NSNumber(value: true), attribute: "Egg" as NSString)
                        let plant = shelter?.createBranch(value: NSNumber(value: false), attribute: "Plant" as NSString)

                        let resultado5 = tree.findAction(forAnswers: [
                            "Start": NSNumber(value: true),
                            "Grass": NSNumber(value: true),
                            "Alone": NSNumber(value: false),
                            "Run": NSNumber(value: false),
                            "Shelter": NSNumber(value: decision5)
                        ])
//                        print(decision5)
                        print(resultado5 ?? "5 não deu certo")

                        
                        if decision5 {
                            let die5 = egg?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                            let die6 = egg?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                        } else {
                            win = true
                        }
                    }
                }
            }
        }
            
            
//            // Alone Attack
//            let attackGrass = aloneGrass?.createBranch(value: NSNumber(value: true), attribute: "Attack" as NSString)
//            let dieGrass = attackGrass?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
//            
//            // Alone Run
//            let runGrass = aloneGrass?.createBranch(value: NSNumber(value: false), attribute: "Run" as NSString)
//            
//            let mudGrass = runGrass?.createBranch(value: NSNumber(value: true), attribute: "Mud" as NSString)
//            let shelterGrass = runGrass?.createBranch(value: NSNumber(value: false), attribute: "Shelter" as NSString)
//            
//            // Mud Die
//            let dieMudGrass = mudGrass?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
//            
//            // Shelter Egg
//            let egg = shelterGrass?.createBranch(value: NSNumber(value: true), attribute: "Egg" as NSString)
//            let plant = shelterGrass?.createBranch(value: NSNumber(value: false), attribute: "Plant" as NSString)
//            
//            // Plant Win
//            let winPlant = plant?.createBranch(value: NSNumber(value: true), attribute: "Win" as NSString)
        
        
        //print(resultado1 ?? "nada")
    }
    
}

