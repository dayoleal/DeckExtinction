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
    
    @State var winView: Bool
    
    @State var decisionTree: Tree? = nil
    @State var action: Bool = false
    @State var result: String = ""
    
    var body: some View {
        NavigationStack {
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
                        scenery: "O céu escurecia quando surge um Herrerasauro! À sua direita, rochas escarpadas oferecem escape se conseguir escalar a tempo. Ou você pode tentar atacá-lo!",
                        scene: "carnivoreScene",
                        option1: "Atacar",
                        option2: "Correr",
                        imgWidth: 250,
                        imgHeight: 280,
                        decision: $decision3,
                        isDone: $isDone
                    )
                case "Attack":
                    CardView(
                        scenery: "O Herrerasauro se aproxima a cada segundo.Seus músculos tencionam, vai derruba-lo com um golpe de calda potente ou tentar se aproximar o suficiente para afastá-lo como a mordida afiada?",
                        scene: "attackScene",
                        option1: "Calda",
                        option2: "Mordida",
                        imgWidth: 230,
                        imgHeight: 250,
                        decision: $decision4,
                        isDone: $isDone
                    )
                case "Run":
                    CardView(
                        scenery: "Uma tempestade se aproxima quando você avista Plantas medicinais. Deseja arriscar-se na lama para adquirí-la ou seguir para uma caverna próxima, onde outros herbívoros já se aglomeram para abrigo?",
                        scene: "rainScene",
                        option1: "Lama",
                        option2: "Abrigo",
                        imgWidth: 250,
                        imgHeight: 250,
                        decision: $decision4,
                        isDone: $isDone
                    )
                case "Shelter":
                    CardView(
                        scenery: "Um rugido faminto ecoava em suas entranhas. Entre as rochas, apenas tufos de samambaia ressecada pareciam disponíveis. Mas lá fora, um ninho destruído revela um ovo intacto, perto o suficiente para você alcançá-lo.",
                        scene: "egg ",
                        option1: "Ovo",
                        option2: "Samambaia",
                        imgWidth: 400,
                        imgHeight: 350,
                        decision: $decision5,
                        isDone: $isDone
                    )
                case "Group":
                    CardView(scenery: "Uma tempestade se aproxima quando você avista Plantas medicinais. Deseja arriscar-se na lama para adquirí-la ou seguir para uma caverna próxima, onde outros herbívoros já se aglomeram para abrigo?",
                             scene: "rainScene",
                             option1: "Lama",
                             option2: "Abrigo",
                             imgWidth: 280,
                             imgHeight: 280,
                             decision: $decision3,
                             isDone: $isDone)
                    
                case "ShelterAlternative":
                    CardView(
                        scenery: "Um rugido ecoava em suas entranhas. Entre as rochas, apenas tufos de samambaia pareciam disponíveis. Mas lá fora, um ninho destruído revela um ovo intacto, perto o suficiente para você alcançá-lo.",
                        scene: "egg",
                        option1: "Ovo",
                        option2: "Samambaia",
                        imgWidth: 400,
                        imgHeight: 350,
                        decision: $decision4,
                        isDone: $isDone
                    )
                case "EggAlternative":
                    CardView(
                        scenery: "Você alcança os ovos, mas então, um rugido gutural corta o vento. Dentre as árvores, o dono dos ovos surge: um Herrerasauro adulto! Ele corre em sua direção. Você tem que decidir entre devorar os ovos, ou fugir.",
                        scene: "egg",
                        option1: "Comer",
                        option2: "Fugir",
                        imgWidth: 400,
                        imgHeight: 350,
                        decision: $decision5,
                        isDone: $isDone
                    )
                    
                case "RunAlternative":
                    CardView(
                        scenery: "O herrerasauro continua a te caçar. Você sabe que o abrigo está perto,onde outros Plateossauros podem te ajudar. Mas será que ouvirão seu chamado? Ou é melhor confiar na sua velocidade e chegar lá antes que ele te alcance?",
                        scene: "carnivoreScene",
                        option1: "Ajuda",
                        option2: "Sozinho",
                        imgWidth: 250,
                        imgHeight: 250,
                        decision: $decision6,
                        isDone: $isDone
                        
                    )
                case "CallHelp":
                    CardView(
                        scenery: "Em segundos, o chão começa a tremer. O bando está vindo! Eles se posicionam ao seu redor, prontos para agir. Agora, a decisão é sua: ordenar um ataque em grupo para expulsar o predador ou tentar uma manobra de distração e fugir?",
                        scene: "group",
                        option1: "Atacar",
                        option2: "Confundir",
                        imgWidth: 250,
                        imgHeight: 280,
                        decision: $decision7,
                        isDone: $isDone
                        
                    )
                case "PlantAlternative":
                    CardView(
                        scenery: "Você mastiga a planta ressecada, mal saciando sua fome. No canto escuro da caverna, filhotes de Plateossauro resmungam famintos. O pouco que resta em suas patas poderia ser dividido ou escondido antes que os outros notem.",
                        scene: "BrownDinosaur",
                        option1: "Dividir",
                        option2: "Esconder",
                        imgWidth: 250,
                        imgHeight: 280,
                        decision: $decision5,
                        isDone: $isDone
                        
                    )
                case "Share":
                    CardView(
                        scenery: "Sua decisão ecoa pelo abrigo. O grupo murmura em uníssono, um chamado ancestral. Eles estão lhe oferecendo algo raro: a liderança do grupo.",
                        scene: "BrownDinosaur",
                        option1: "Aceitar",
                        option2: "Recusar",
                        imgWidth: 250,
                        imgHeight: 280,
                        decision: $decision6,
                        isDone: $isDone
                        
                    )
                case "Hide":
                    CardView(
                        scenery: "Você engole os últimos pedaços as escondidas, mas um som furioso interrompe sua refeição. O líder do bando sabe o que você fez. Você pode tentar enfrentá-lo em um duelo ou fugir.",
                        scene: "BrownDinosaur",
                        option1: "Desafiar",
                        option2: "Fugir",
                        imgWidth: 250,
                        imgHeight: 280,
                        decision: $decision6,
                        isDone: $isDone
                        
                    )
                default:
                    if count != 0 && winView {
                        FinalCardView(
                            scenario: "Parabéns, Sobrevivente do Triássico! Suas escolhas sábias sob tempestades, ataques de predadores e escassez de alimento provaram que você domina a arte da sobrevivência pré-histórica. Cada decisão estratégica moldou um herbívoro verdadeiramente resiliente.",
                            scene: "loadingDino",
                            width: 200,
                            height: 200
                        )
                    }
                    else if count != 0 {
                        FinalCardView(
                            scenario: "Aqui jaz um Plateossauro que cometeu um erro de comportamento. Análise sedimentar prova que sua última decisão foi fatal para muitos dos herbívoros neste ecossistema.",
                            scene: "loadingDino",
                            width: 200,
                            height: 200
                        )
                    }
                }
                
                if count == 0 {
                    CardView(scenery: "Seu estômago ruge enquanto você avista duas fontes de alimento: um campo de grama tenra ou folhas suculentas nas árvores altas. Escolha sabiamente, sua decisão afetará sua energia e evolução!", scene: "landscape", option1: "Gramado", option2: "Folhas", imgWidth: 250, imgHeight: 250, decision: $decision1, isDone: $isDone)
                }
            }
        }.navigationBarBackButtonHidden(true)
        
            .onAppear() {
                decisionTree = Tree(decision1, decision2, decision3, decision4, decision5,decision6,decision7,decision8, winView)
                
                decisionTree?.creation(count: count)
            }
            .onChange(of: isDone) { oldValue, newValue in
                count += 1
                
                decisionTree = Tree(decision1, decision2, decision3, decision4, decision5,decision6,decision7,decision8, winView)
                
                if let decision = decisionTree {
                    decision.creation(count: count)
                }
            }
            .onChange(of: decisionTree?.resultado ?? "a") { oldValue, newValue in
                result = newValue
            }
            .onChange(of: decisionTree?.win ?? false) { oldValue, newValue in
                winView = newValue
            }
    }
}

#Preview {
    ContentView(winView: false)
}
