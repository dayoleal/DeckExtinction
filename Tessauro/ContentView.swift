import SwiftUI

struct ContentView: View {
    @State var decision1: Bool = false
    @State var decision2: Bool = false
    @State var decision3: Bool = false
    @State var decision4: Bool = false
    @State var decision5: Bool = false
    @State var isDone: Bool = false
    
    var die: Bool
    var win: Bool
    
    @State var decisionTree: Tree? = nil
    @State var action: Bool = false
    @State var result: String = ""
    
    var body: some View {
        VStack {
//            switch(result) {
//            case "Grass":
//                Text("oi")
//            default:
//                Text("não")
//            }
            CardView(
                scenery: "Seu estômago ruge enquanto você avista duas fontes de alimento: um campo de grama tenra ou folhas suculentas nas árvores altas. Escolha sabiamente, sua decisão afetará sua energia e evolução!",
                scene: "landscape",
                option1: "Pastar no Gramado",
                option2: "Tentar alcançar folhas",
                imgWidth: 250,
                imgHeight: 250,
                decision: $decision1,
                isDone: $isDone
            )
        }
        .onAppear() {
            decisionTree = Tree(decision1, decision2, decision3, decision4, decision5)
            decisionTree?.creation()
        }
        .onChange(of: isDone) { oldValue, newValue in
            if let decision = decisionTree {
                decisionTree?.creation()
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
