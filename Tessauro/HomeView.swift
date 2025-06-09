import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    Color.lightBackground
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            NavigationLink {
                                LoadingView()
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
                                    Image(systemName: "info.circle")
                                        .font(.title)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        .padding(30)
                        
                        Text("T-SAURO")
                            .font(.title)
                        
                        Spacer()
                        ZStack {
                            Rectangle()
                                .fill(.brownBackground)
                                .ignoresSafeArea()
                                .frame(height: 360)
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(.brownSecondary)
                                        .frame(width: 340, height: 200)
                                    
                                    Text("E se você tivesse nascido na Era Mesozoica como um dinossauro? Seria o predador supremo ou só mais uma vítima da implacável seleção natural?")
                                        .frame(width: 280, height: 200)
                                        .font(.headline)
                                        .foregroundColor(.lightBackground)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }
                                
                                Button(action: {
                                    DinodexView()
                                },
                                       label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                            .frame(width: 150, height: 50)
                                        HStack {
                                            Image(systemName: "gamecontroller")
                                                .foregroundStyle(.black)
                                            Text("Jogar")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                        }
                                    }
                                }).padding()
                            }
                        }
                    }
                }
                
                ZStack {
                    Image(.brownDinosaur)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 260)
                    
                    Image(.greenDinasaur)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 260)
                        .scaleEffect(x: -1)
                        .padding(.top, 15)
                }.padding(.bottom, 120)
            }
        }
    }
}

#Preview {
    HomeView()
}
