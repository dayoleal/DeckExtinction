import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                        Color.lightBackground
                            .ignoresSafeArea()
                        
                        VStack {
                            HStack {
                                NavigationLink {
                                    TutorialView()
                                } label: {
                                    Label("", systemImage: "info.circle")
                                        .font(.title)
                                }
                                
                                
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
                            }
                            .padding(30)
                            
                            Text("DeckExtinction")
                                .font(Font.custom("ZCOOLKuaiLe-Regular.ttf", size: 32))
                            
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .fill(.brownBackground)
                                    .ignoresSafeArea()
                                    .frame(height: geometry.size.height * 0.44)
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(.brownSecondary)
                                            .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.25)
                                        
                                        Text("E se você tivesse nascido na Era Mesozoica como um dinossauro? Seria o predador supremo ou só mais uma vítima da implacável seleção natural?")
                                            .frame(width: 280, height: 200)
                                            .font(.headline)
                                            .foregroundColor(.lightBackground)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                    }
                                    
                                    if geometry.size.height < 700 {
                                        NavigationLink {
                                            ContentView(winView: false)
                                        } label: {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 150, height: 50)
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
                                    } else {
                                        NavigationLink {
                                            ContentView(winView: false)
                                        } label: {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 150, height: 50)
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
                                        .padding(.top)
                                    }
                                }
                            }
                        }
                    
                    ZStack {
                        Image(.brownDinosaur)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.35)
                        
                        Image(.greenDinasaur)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.35)
                            .scaleEffect(x: -1)
                            .padding(.top, 15)
                    }.padding(.bottom, geometry.size.height * 0.096)
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
