import SwiftUI

struct FinalCardView: View {
    var scenario: String
    var scene: String
    var width: CGFloat
    var height: CGFloat
    
    init(scenario: String, scene: String, width: CGFloat, height: CGFloat) {
        self.scenario = scenario
        self.scene = scene
        self.width = width
        self.height = height
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color.brownBackground
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                DinodexView()
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 44, height: 44)
                                    Image("dino.egg")
                                        .font(.title)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        .padding()
                        .padding(.bottom)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                                .foregroundColor(.brownSecondary)
                                
                            VStack {
                                Text(scenario)
                                    .frame(width: geometry.size.width * 0.8)
                                    .foregroundColor(.lightBackground)
                                    .fontWeight(.bold)
                                    .padding(.bottom)
                                    .multilineTextAlignment(.center)
                                ZStack {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.lightBackground)
                                        .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.4)
                                    Image(scene)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.35)
                                }
                            }
                        }
                        .offset(y: -geometry.size.height * 0.02)
                        
                        HStack {
                            NavigationLink {
                                ContentView(winView: false)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .frame(width: 120, height: 50)
                                    HStack {
                                        Image(systemName: "gamecontroller")
                                            .foregroundStyle(.black)
                                            .bold()
                                        Text("Jogar")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .padding(.bottom)
                            .padding(.trailing)
                            
                            
                            
                            NavigationLink {
                                HomeView()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .frame(width: 120, height: 50)
                                    HStack {
                                        Image(systemName: "house.fill")
                                            .foregroundStyle(.black)
                                            .bold()
                                        Text("Início")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .padding(.bottom)
                            .padding(.leading)
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    FinalCardView(
        scenario: "Parabéns, Sobrevivente do Triássico! Suas escolhas sábias sob tempestades, ataques de predadores e escassez de alimento provaram que você domina a arte da sobrevivência pré-histórica. Cada decisão estratégica moldou um herbívoro verdadeiramente resiliente.",
        scene: "loadingDino",
        width: 200,
        height: 200
    )
}
