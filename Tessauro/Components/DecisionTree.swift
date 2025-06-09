import Foundation
import GameplayKit
import Combine

class Tree: ObservableObject {
    var decision1: Int
    var decision2: Int
    var decision3: Int
    var decision4: Int
    var decision5: Int
    var decision6: Int
    var decision7: Int
    var decision8: Int
    
    var decisionBool1: Bool = false
    var decisionBool2: Bool = false
    var decisionBool3: Bool = true
    var decisionBool4: Bool = false
    var decisionBool5: Bool = false
    var decisionBool6: Bool = false
    var decisionBool7: Bool = false
    var decisionBool8: Bool = false

    @Published public var resultado: String = "por enquanto nenhum"
    
    init(_ decision1: Int, _ decision2: Int, _ decision3: Int, _ decision4: Int, _ decision5: Int, _ decision6: Int, _ decision7: Int, _ decision8: Int) {
        self.decision1 = decision1
        self.decision2 = decision2
        self.decision3 = decision3
        self.decision4 = decision4
        self.decision5 = decision5
        self.decision6 = decision6
        self.decision7 = decision7
        self.decision8 = decision8
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
        setDecision(decision: &decision6, decisionBool: &decisionBool6)
        setDecision(decision: &decision7, decisionBool: &decisionBool7)
        setDecision(decision: &decision8, decisionBool: &decisionBool8)
        
        var die: Bool = false
        var win: Bool = false
        
        // Grass or Forest
        let grassScenery = tree.rootNode?.createBranch(value: NSNumber(value: true), attribute: "Grass" as NSString)
        let forestScenery = tree.rootNode?.createBranch(value: NSNumber(value: false), attribute: "Grass" as NSString)
        
        let resultado1 = tree.findAction(forAnswers: [
            "Start": NSNumber(value: decisionBool1)
        ])
        print(resultado1 ?? "1 não deu certo")
        
        if count == 1 {
            self.resultado = resultado1?.description ?? "O 1 não foi"
            print("esse e o resultado: \(resultado)")
        }
        
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
                let kick = attack?.createBranch(value: NSNumber(value: true), attribute: "Kick" as NSString)
                let bite = attack?.createBranch(value: NSNumber(value: false), attribute: "Bite" as NSString)
                
                let resultado4 = tree.findAction(forAnswers: [
                    "Start": NSNumber(value: true),
                    "Grass": NSNumber(value: true),
                    "Alone": NSNumber(value: true),
                    "Attack": NSNumber(value: decisionBool4)
                ])
                
                print(resultado4 ?? "4 não deu certo")
                if count == 4 {
                    self.resultado = resultado4?.description ?? "O 4 não foi"
                    print("esse e o resultado: \(resultado)")
                }
                
                if decisionBool4 {
                    let die = kick?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                    let die2 = kick?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                }else {
                    let diee = bite?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                    let diee2 = bite?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                }
            }
            else {
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
                }
                else {
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
                    }
                    else {
                        // TODO: Resolver isso aqui
                        win = true
                    }
                }
            }
        }
        else {
            let mud = group?.createBranch(value: NSNumber(value: true), attribute: "MudAlternative" as NSString)
            let shelter = group?.createBranch(value: NSNumber(value: false), attribute: "ShelterAlternative" as NSString)
            
            let resultado3 = tree.findAction(forAnswers: [
                "Start": NSNumber(value: true),
                "Grass": NSNumber(value: false),
                "Group": NSNumber(value: decisionBool3)
            ])
            
            print(resultado3 ?? "3 não deu certo")
            if count == 3 {
                self.resultado = resultado3?.description ?? "O 3 não foi"
                print("esse e o resultado: \(resultado)")
            }
            
            if decisionBool3 {
                let die1 = mud?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                let die2 = mud?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
            }
            else {
                let egg = shelter?.createBranch(value: NSNumber(value: true), attribute: "EggAlternative" as NSString)
                let plant = shelter?.createBranch(value: NSNumber(value: false), attribute: "PlantAlternative" as NSString)
                
                let resultadoP4 = tree.findAction(forAnswers: [
                    "Start": NSNumber(value: true),
                    "Grass": NSNumber(value: false),
                    "Group": NSNumber(value: false),
                    "ShelterAlternative": NSNumber(value: decisionBool4)
                ])
                
                print(resultadoP4 ?? "4 não deu certo")
                if count == 4 {
                    self.resultado = resultadoP4?.description ?? "O 4 não foi"
                    print("esse e o resultado: \(resultado)")
                }
                
                if decisionBool4 {
                    let eat = egg?.createBranch(value: NSNumber(value: true), attribute: "Eat" as NSString)
                    let runAlternative = egg?.createBranch(value: NSNumber(value: false), attribute: "RunAlternative" as NSString)
                    
                    let resultado5 = tree.findAction(forAnswers: [
                        "Start": NSNumber(value: true),
                        "Grass": NSNumber(value: false),
                        "Group": NSNumber(value: false),
                        "ShelterAlternative": NSNumber(value: true),
                        "EggAlternative": NSNumber(value: decisionBool5)
                    ])
                    
                    print(resultado5 ?? "5 não deu certo")
                    if count == 5 {
                        self.resultado = resultado5?.description ?? "O 5 não foi"
                        print("esse e o resultado: \(resultado)")
                    }
                    
                    if decisionBool5 {
                        let die3 = eat?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                        let die4 = eat?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                    }
                    else {
                        let callHelp = runAlternative?.createBranch(value: NSNumber(value: true), attribute: "CallHelp" as NSString)
                        let noHelp = runAlternative?.createBranch(value: NSNumber(value: false), attribute: "NoHelp" as NSString)
                        
                        let resultado6 = tree.findAction(forAnswers: [
                            "Start": NSNumber(value: true),
                            "Grass": NSNumber(value: false),
                            "Group": NSNumber(value: false),
                            "ShelterAlternative": NSNumber(value: true),
                            "EggAlternative": NSNumber(value: false),
                            "RunAlternative": NSNumber(value: decisionBool6)
                        ])
                        
                        print(resultado6 ?? "6 não deu certo")
                        if count == 6 {
                            self.resultado = resultado6?.description ?? "O 6 não foi"
                            print("esse e o resultado: \(resultado)")
                        }
                        
                        if decisionBool6 {
                            let attack = callHelp?.createBranch(value: NSNumber(value: true), attribute: "Win" as NSString)
                            let confuse = callHelp?.createBranch(value: NSNumber(value: false), attribute: "Win" as NSString)
                        }
                        else {
                            let die4 = noHelp?.createBranch(value: NSNumber(value: true), attribute: "Die" as NSString)
                            let die5 = noHelp?.createBranch(value: NSNumber(value: false), attribute: "Die" as NSString)
                        }
                    }
                }
                else {
                    let share = plant?.createBranch(value: NSNumber(value: true), attribute: "Share" as NSString)
                    let hide = plant?.createBranch(value: NSNumber(value: false), attribute: "Hide" as NSString)
                    
                    let resultado5 = tree.findAction(forAnswers: [
                        "Start": NSNumber(value: true),
                        "Grass": NSNumber(value: false),
                        "Group": NSNumber(value: false),
                        "ShelterAlternative": NSNumber(value: false),
                        "PlantAlternative": NSNumber(value: decisionBool5)
                    ])
                    
                    print(resultado5 ?? "5 não deu certo")
                    if count == 5 {
                        self.resultado = resultado5?.description ?? "O 5 não foi"
                        print("esse e o resultado: \(resultado)")
                    }
                    
                    if decisionBool5 {
                        let leader = share?.createBranch(value: NSNumber(value: true), attribute: "Leader" as NSString)
                        let noLeader = share?.createBranch(value: NSNumber(value: true), attribute: "NoLeader" as NSString)
                        
                        let resultado6 = tree.findAction(forAnswers: [
                            "Start": NSNumber(value: true),
                            "Grass": NSNumber(value: false),
                            "Group": NSNumber(value: false),
                            "ShelterAlternative": NSNumber(value: false),
                            "PlantAlternative": NSNumber(value: true),
                            "Share": NSNumber(value: decisionBool6)
                        ])
                        
                        print(resultado6 ?? "6 não deu certo")
                        if count == 6 {
                            self.resultado = resultado6?.description ?? "O 6 não foi"
                            print("esse e o resultado: \(resultado)")
                        }
                        
                        if !decisionBool6 { 
                            let winNoLeader = noLeader?.createBranch(value: NSNumber(value: true), attribute: "Win" as NSString)
                            let winNoLeader2 = noLeader?.createBranch(value: NSNumber(value: false), attribute: "Win" as NSString)
                        } else {
                            let winLeader = leader?.createBranch(value: NSNumber(value: true), attribute: "Win" as NSString)
                            let winLeader2 = leader?.createBranch(value: NSNumber(value: false), attribute: "Win" as NSString)
                        }
                    } else {
                        let challange = hide?.createBranch(value: NSNumber(value: true), attribute: "Challenge" as NSString)
                        let runAway = hide?.createBranch(value: NSNumber(value: false), attribute: "RunAway" as NSString)
                        
                        let resultado6 = tree.findAction(forAnswers: [
                            "Start": NSNumber(value: true),
                            "Grass": NSNumber(value: false),
                            "Group": NSNumber(value: false),
                            "Shelter": NSNumber(value: false),
                            "PlantAlternative": NSNumber(value: false),
                            "Hide": NSNumber(value: decisionBool6)
                        ])
                        
                        print(resultado6 ?? "6 não deu certo")
                        if count == 6 {
                            self.resultado = resultado6?.description ?? "O 6 não foi"
                            print("esse e o resultado: \(resultado)")
                        }
                    }
                }
            }
        }
    }
}

//extension Int {
//    var nsNumber: NSNumber {
//        NSNumber(int: self)
//    }
//}
