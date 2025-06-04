import SwiftUI

struct ContentView: View {
    
    var decisionTree = Tree()
    
    var body: some View {
        VStack {
            
        }
        .padding()
        .onAppear(){
            decisionTree.creation()
        }
    }
}

#Preview {
    ContentView()
}
