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
                                    .frame(width: 45, height: 45)
                                Image("dino.egg")
                                    .font(.title)
                                    .foregroundStyle(.black)
                            }
                        }
                    }.padding(20)
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 400, height: 610)
                            .foregroundColor(.brownSecondary)
                        VStack {
                            Text(scenario)
                                .frame(width: 350)
                                .foregroundColor(.lightBackground)
                                .fontWeight(.bold)
                                .padding(.bottom)
                                .multilineTextAlignment(.center)
                            ZStack {
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.lightBackground)
                                    .frame(width: 300, height: 300)
                                Image(scene)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: width, height: height)
                            }
                        }
                    }
                    
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
                        }.padding()
                        
                        
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
                        }.padding()
                    }
                }
            }
            
        }
    }
}
