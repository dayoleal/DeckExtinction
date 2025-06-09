import SwiftUI

struct ContentView: View {
    @State var decision1: Int = 0
    @State var decision2: Int = 0
    @State var decision3: Int = 0
    @State var decision4: Int = 0
    @State var decision5: Int = 0
    @State var decision6: Int = 0
    @State var decision7: Int = 0
    @State var decision8: Int = 0

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
                    option1: "Ignorar",
                    option2: "Se juntar",
                    imgWidth: 370,
                    imgHeight: 300,
                    decision: $decision2,
                    isDone: $isDone
                )
            case "Alone":
                CardView(
                    scenery: "O céu escurecia quando surge um Herrerasauro! À sua direita, rochas escarpadas oferecem escape se conseguir escalar a tempo. Ou você pode desferir um golpe de cauda.",
                    scene: "BrownDinosaur",
                    option1: "Atacar",
                    option2: "Correr",
                    imgWidth: 250,
                    imgHeight: 280,
                    decision: $decision3,
                    isDone: $isDone
                )
            case "Run":
                CardView(
                    scenery: "Uma tempestade se aproxima quando você avista Plantas medicinais. Deseja arriscar-se na lama para adquirí-la ou seguir para uma caverna próxima, onde outros herbívoros já se aglomeram para abrigo?",
                    scene: "BrownDinossaur", 
                    option1: "Lama",
                    option2: "Abrigo",
                    imgWidth: 300,
                    imgHeight: 350,
                    decision: $decision4,
                    isDone: $isDone
                )
            case "Shelter":
                CardView(
                    scenery: "A tempestade rugia lá fora, sem sinais de trégua. Um rugido faminto ecoava em suas entranhas. Entre as rochas, apenas tufos de samambaia ressecada pareciam disponíveis. Mas lá fora, um ninho destruído revela um ovo intacto, perto o suficiente para você alcançá-lo.",
                    scene: "egg",
                    option1: "Ovo",
                    option2: "Samambaia",
                    imgWidth: 400,
                    imgHeight: 350,
                    decision: $decision5,
                    isDone: $isDone
                )
            case "Plant":
                FinalCardView(
                    scenario: "Parabéns, Sobrevivente do Triássico! Suas escolhas sábias sob tempestades, ataques de predadores e escassez de alimento provaram que você domina a arte da sobrevivência pré-histórica. Cada decisão estratégica moldou um herbívoro verdadeiramente resiliente.\n\nSua jornada continua... mas agora, com um dinossauro da era jurassica/ cretácia!",
                    scene: "loadingDino",
                    width: 200,
                    height: 200
                )
            default:
                if count != 0 {
                    FinalCardView(
                        scenario: "Aqui jaz um Plateossauro que cometeu um erro de comportamento. Análise sedimentar prova que sua última decisão foi fatal para muitos dos herbívoros neste ecossistema.",
                        scene: "loading",
                        width: 200,
                        height: 200
                    )
                }
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
            decisionTree = Tree(decision1, decision2, decision3, decision4, decision5, decision6, decision7, decision8)
            decisionTree?.creation(count: count)
        }
        .onChange(of: isDone) { oldValue, newValue in
            count += 1
            decisionTree = Tree(decision1, decision2, decision3, decision4, decision5, decision6, decision7, decision8)
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
