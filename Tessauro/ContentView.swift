import SwiftUI

struct ContentView: View {
    var decision1: Bool = true
    var decision2: Bool = true
    var decision3: Bool = false
    var decision4: Bool = false
    var decision5: Bool = false
    var die: Bool
    var win: Bool
    
    @State var decisionTree: Tree? = nil
    
    var body: some View {
        VStack {
            Button(action: {
                if let decisionTree = decisionTree {
                    decisionTree.creation()
                }
            }) {
                Text("oi")
            }
        }
        .padding()
        .onAppear(){
            decisionTree = Tree(decision1, decision2, decision3, decision4, decision5)
        }
    }
}

#Preview {
    ContentView(die: false, win: false)
}
