import SwiftUI

struct LoadingView: View {
    @State private var progress = 0.6
    
    var body: some View {
        ZStack {
            Color.brownBackground
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Circle()
                        .fill(.lightBackground)
                        .frame(width: 245, height: 245)
                        .padding(.bottom, 30)
                    Image(.loadingDino)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 40)
                }
                Text("Você sabia que muitos dos dinossauros tinham penas? ")
                    .foregroundStyle(.lightBackground)
                    .frame(width: 330)
                    .font(.title3)
                    .bold()
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding(.top, 15)
                    .scaleEffect(1.5) .tint(.lightBackground)
            }
        }
    }
}

#Preview {
    LoadingView()
}
