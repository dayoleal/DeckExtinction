import SwiftUI

struct TutorialView: View {
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
                                    .foregroundStyle(.accent)
                                Image("dino.egg")
                                    .font(.title)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .padding()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.brownSecondary)
                                .frame(height: 850)
                            
                            VStack (spacing: 10) {
                                Text("TUTORIAL")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                
                                Text("\nObjetivo:")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("Sobreviva a Era Mesozoica assumindo o papel de um dinossauro diferente a cada rodada!\n\nVocê vencerá ao fazer escolhas que estejam alinhadas com o comportamento típico do seu dinossauro.")
                                
                                Text("\nComo Funciona:")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("\n• A cada rodada finalizada com sucesso você desbloqueará um novo dinossauro.")
                                    .frame(width:350)
                                    .alignmentGuide(.leading, computeValue: {_ in 0})
                                Text("\n• Durante o jogo serão apresentadas situações em que você deve escolher entre duas opções.")
                                    .frame(width:350)
                                    .alignmentGuide(.leading, computeValue: {_ in 0})
                                Text("\n• Use os botões inferiores esquerdo e direito da tela para tomar sua decisão.")
                                    .frame(width:350)
                                    .alignmentGuide(.leading, computeValue: {_ in 0})
                                Text("\n• Suas escolhas afetam seu nível de energia, que é essencial para a sua sobrevivência.")
                                    .frame(width:350)
                                    .alignmentGuide(.leading, computeValue: {_ in 0})
                                                                
                                Text("\nImportante!")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("Quer saber com qual dinossauro está jogando e ver mais informações sobre ele? Toque no ícone de ovo no canto superior direito da tela para abrir a sua coleção de dinossauros.")
                                   
                            }
                            .foregroundStyle(.lightBackground)
                            .padding()
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
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    TutorialView()
}



              
