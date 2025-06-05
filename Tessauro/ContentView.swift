import SwiftUI

struct ContentView: View {
    @State var decision1: Bool = true
    @State var decision2: Bool = false
    @State var decision3: Bool = false
    @State var decision4: Bool = false
    @State var decision5: Bool = false
    @State var isDone: Bool = false
    @State var count: Int = 0
    
    var die: Bool
    var win: Bool
    
    @State var decisionTree: Tree? = nil
    @State var action: Bool = false
    @State var result: String = ""
    
    var body: some View {
        VStack {
            switch(result) {
            case "Grass":
                CardView(
                    scenery: "Enquanto você se alimenta, rugidos familiares ecoam no ambiente e uma manada de plateossauros passa por perto. Alguns olhares curiosos surgem. Quer tentar se juntar a eles ou seguir seu caminho em silêncio",
                    scene: "group",
                    option1: "Se juntar",
                    option2: "Ignorar",
                    imgWidth: 370,
                    imgHeight: 300,
                    decision: $decision2,
                    isDone: $isDone
                )
            case "Alone":
                CardView(
                    scenery: "O céu escurecia quando surge um Herrerasauro! À sua direita, rochas escarpadas oferecem escape se conseguir escalar a tempo. Ou você pode desferir um golpe de cauda.",
                    scene: "BrownDinosaur",
                    option1: "Correr",
                    option2: "Atacar",
                    imgWidth: 250,
                    imgHeight: 280,
                    decision: $decision3,
                    isDone: $isDone
                )
                
            default:
                Text("não")
            }
            if count == 0 {
                CardView(
                    scenery: "Seu estômago ruge enquanto você avista duas fontes de alimento: um campo de grama tenra ou folhas suculentas nas árvores altas. Escolha sabiamente, sua decisão afetará sua energia e evolução!",
                    scene: "landscape",
                    option1: "Gramado",
                    option2: "Folhas",
                    imgWidth: 250,
                    imgHeight: 250,
                    decision: $decision1,
                    isDone: $isDone
                )
            }
        }
        .onAppear() {
            decisionTree = Tree(decision1, decision2, decision3, decision4, decision5)
            decisionTree?.creation(count: count)
        }
        .onChange(of: isDone) { oldValue, newValue in
            count += 1
            if let decision = decisionTree {
                decision.creation(count: count)
            }
        }
        .onChange(of: decisionTree?.resultado ?? "a") { oldValue, newValue in
            result = newValue
        }
    }
}

#Preview {
    ContentView(die: false, win: false)
}
