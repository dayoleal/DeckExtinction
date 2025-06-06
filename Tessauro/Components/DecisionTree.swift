import Foundation
import GameplayKit
import Combine

class Tree: ObservableObject {
    var decision1: Int
    var decision2: Int
    var decision3: Int
    var decision4: Int
    var decision5: Int
    
    var decisionBool1: Bool = false
    var decisionBool2: Bool = false
    var decisionBool3: Bool = false
    var decisionBool4: Bool = false
    var decisionBool5: Bool = false
    @Published public var resultado: String = "por enquanto nenhum"
    
    init(_ decision1: Int, _ decision2: Int, _ decision3: Int, _ decision4: Int, _ decision5: Int) {
        self.decision1 = decision1
        self.decision2 = decision2
        self.decision3 = decision3
        self.decision4 = decision4
        self.decision5 = decision5
    }
    
    func setDecision(decision: inout Int, decisionBool: inout Bool) {
        if (decision == 1) {
            decisionBool = true
        } else if(decision == -1) {
            decisionBool = false
        }
    }
    
    func creation(count: Int) {
        let tree = GKDecisionTree(attribute: "Start" as NSString)
        
        setDecision(decision: &decision1, decisionBool: &decisionBool1)
        setDecision(decision: &decision2, decisionBool: &decisionBool2)
        setDecision(decision: &decision3, decisionBool: &decisionBool3)
        setDecision(decision: &decision4, decisionBool: &decisionBool4)
        setDecision(decision: &decision5, decisionBool: &decisionBool5)

        var die: Bool = false
        var win: Bool = false
        
        // Grass or Forest
        let grassScenery = tree.rootNode?.createBranch(value: NSNumber(value: true), attribute: "Grass" as NSString)
        let forestScenery = tree.rootNode?.createBranch(value: NSNumber(value: false), attribute: "Forest" as NSString)
        
        let resultado1 = tree.findAction(forAnswers: [
            "Start": NSNumber(value: decisionBool1)
        ])
        print(resultado1 ?? "1 não deu certo")
        
        if count == 1 {
            self.resultado = resultado1?.description ?? "O 1 não foi"
            print("esse e o resultado: \(resultado)")
        }
        
        if decisionBool1 {
            // Alone or Group
            let alone = grassScenery?.createBranch(value: NSNumber(value: true), attribute: "Alone" as NSString)
            let group = grassScenery?.createBranch(value: NSNumber(value: false), attribute: "Group" as NSString)
            
            let resultado2 = tree.findAction(forAnswers: [
                "Start": NSNumber(value: true),
                "Grass": NSNumber(value: decisionBool2)
            ])
            print(resultado2 ?? "2 não deu certo")
            if count == 2 {
                self.resultado = resultado2?.description ?? "O 2 não foi"
                print("esse e o resultado: \(resultado)")
            }
            
            if decisionBool2 {
                let attack = alone?.createBranch(value: NSNumber(value: true), attribute: "Attack" as NSString)
                let run = alone?.createBranch(value: NSNumber(value: false), attribute: "Run" as NSString)
                
                let resultado3 = tree.findAction(forAnswers: [
                    "Start": NSNumber(value: true),
                    "Grass": NSNumber(value: true),
                    "Alone": NSNumber(value: decisionBool3)
                ])
                print(resultado3 ?? "3 não deu certo")
                if count == 3 {
                    self.resultado = resultado3?.description ?? "O 3 não foi"
                    print("esse e o resultado: \(resultado)")
                }
                
                if decisionBool3 {
                    let die = attack?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                    let die2 = attack?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                } else {
                    let mud = run?.createBranch(value: NSNumber(value: true), attribute: "Mud" as NSString)
                    let shelter = run?.createBranch(value: NSNumber(value: false), attribute: "Shelter" as NSString)
                    
                    let resultado4 = tree.findAction(forAnswers: [
                        "Start": NSNumber(value: true),
                        "Grass": NSNumber(value: true),
                        "Alone": NSNumber(value: false),
                        "Run": NSNumber(value: decisionBool4)
                    ])
                    print(resultado4 ?? "4 não deu certo")
                    if count == 4 {
                        self.resultado = resultado4?.description ?? "O 4 não foi"
                        print("esse e o resultado: \(resultado)")
                    }
                    
                    if decisionBool4 {
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
                            "Shelter": NSNumber(value: decisionBool5)
                        ])
                        print(resultado5 ?? "5 não deu certo")
                        if count == 5 {
                            self.resultado = resultado5?.description ?? "O 5 não foi"
                            print("esse e o resultado: \(resultado)")
                        }
                        
                        if decisionBool5 {
                            let die5 = egg?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                            let die6 = egg?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                        } else {
                            win = true
                        }
                    }
                }
            }
        } else {
            let die7 = forestScenery?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
        }

    }
    
}
