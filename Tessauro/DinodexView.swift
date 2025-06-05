import SwiftUI
    
struct DinodexView: View {
    var body: some View {
        
        ZStack {
            ZStack {
                Color.lightBackground
                    .ignoresSafeArea()
                
                VStack {
                    Text("PLATEOSSAURO")
                        .font(.title)
                        .padding(.top)
                    
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(.brownBackground)
                            .ignoresSafeArea()
                            .frame(height: 480)
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.brownSecondary)
                                    .frame(width: 340, height: 360)
                                    .padding(.top)
                                
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
                                    }.fontWeight(.bold)
                                    
                                    Text("Você  sabia que o Plateossauro vivia em bandos? Uma evidência disso foram fósseis encontrados com dezenas de esqueletos, indicando mortes em massa causadas por enchentes ou lamaçais.")
                                        .frame(width: 305)
                                    
                                    Text("Essa era a principal estratégia de defesa contra predadores carnívoros, que eram maiores e mais ágeis.")
                                        .frame(width: 305)
                                }
                                .foregroundStyle(.yellowLetter)
                                
                                HStack {
                                    Spacer()
                                    ZStack {
                                        Circle()
                                            .frame(width: 45, height: 45)
                                            .foregroundStyle(.greenBrackground)
                                        Image(systemName: "leaf.fill")
                                            .foregroundStyle(.greenLeaf)
                                    }
                                    .padding(.bottom, 320)
                                }
                            }.padding()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
                            })
                        }
                    }
                }
            }
            
            ZStack {
                Image(.brownDinosaur)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 260)
                
            }.padding(.bottom, 350)
        }
    }
}

#Preview {
    DinodexView()
}
