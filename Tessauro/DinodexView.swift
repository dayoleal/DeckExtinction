import SwiftUI

struct DinodexView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    ZStack {
                        Color.lightBackground
                            .ignoresSafeArea()
                        
                        VStack {
                            Text("PLATEOSSAURO")
                                .font(Font.custom("ZCOOLKuaiLe-Regular", size: 30))
                            
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .fill(.brownBackground)
                                    .ignoresSafeArea()
                                    .frame(height: geometry.size.height * 0.68)
                                VStack {
                                    ZStack {
                                        if geometry.size.height < 700 {
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(.brownSecondary)
                                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.45)
                                                .padding(.top)
                                        } else {
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(.brownSecondary)
                                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5)
                                                .padding(.top)
                                        }
                                        
                                        VStack (spacing: 15) {
                                            Text("TRIÁSSICO")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                            
                                            VStack(alignment: .leading) {
                                                HStack (spacing: 30) {
                                                    Indicator()
                                                    Indicator2()
                                                }
                                                HStack (spacing: 35){
                                                    Text("Comprimento: 8 m")
                                                    Text("Peso: 4 t")
                                                }
                                            }.fontWeight(.medium)
                                            
                                            if geometry.size.height < 700 {
                                                Text("Você  sabia que o Plateossauro vivia em bandos? Uma evidência disso foram fósseis encontrados com dezenas de esqueletos, indicando mortes em massa causadas por enchentes ou lamaçais.")
                                                    .frame(width: geometry.size.width * 0.84, height: geometry.size.height * 0.2)
                                            } else {
                                                Text("Você  sabia que o Plateossauro vivia em bandos? Uma evidência disso foram fósseis encontrados com dezenas de esqueletos, indicando mortes em massa causadas por enchentes ou lamaçais.\n\nEssa era a principal estratégia de defesa contra predadores carnívoros, que eram maiores e mais ágeis.")
                                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.35)
                                            }
                                        }
                                        .padding(.top, geometry.size.height * 0.03)
                                        .foregroundStyle(.yellowLetter)
                                        
                                        if geometry.size.height < 700 {
                                            HStack {
                                                Spacer()
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 45, height: 45)
                                                        .foregroundStyle(.greenBrackground)
                                                    Image(systemName: "leaf.fill")
                                                        .foregroundStyle(.greenLeaf)
                                                }
                                            }.padding(.bottom, geometry.size.height * 0.41)
                                        } else {
                                            HStack {
                                                Spacer()
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 45, height: 45)
                                                        .foregroundStyle(.greenBrackground)
                                                    Image(systemName: "leaf.fill")
                                                        .foregroundStyle(.greenLeaf)
                                                }
                                            }.padding(.bottom, geometry.size.height * 0.46)
                                        }
                                    }
                                    
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
                                    }.padding(.top)
                                }
                            }
                        }
                    }
                    
                    ZStack {
                        Image(.brownDinosaur)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.25)
                        
                    }.padding(.bottom, geometry.size.height * 0.535)
                }
            }
        }
    }
}

#Preview {
    DinodexView()
}
