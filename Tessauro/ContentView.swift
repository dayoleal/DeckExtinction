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
    @State var action: Bool = false
    @State var result: String = ""
    
    var body: some View {
        VStack {
            Button(action: {
                    action.toggle()
            }){
                Text("oi")
            }
                Text(result)
        }
        .padding()
        .onChange(of: action) { oldValue, newValue in
            decisionTree = Tree(decision1, decision2, decision3, decision4, decision5)
            decisionTree?.creation()
        }
        .onChange(of: decisionTree?.resultado ?? "a") { oldValue, newValue in
            result = newValue
        }
    }
}

#Preview {
    ContentView(die: false, win: false)
}
