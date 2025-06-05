//
//  TutorialView.swift
//  Tessauro
//
//  Created by Aluno Mack on 03/06/25.
//

import SwiftUI

struct TutorialView: View {
    var bulletPoints: [String] = [
        "A cada rodada finalizada com sucesso você desbloqueará um novo dinossauro.",
        "Durante o jogo serão apresentadas situações em que você deve escolher entre duas opções.",
        "Use os botões inferiores esquerdo e direito da tela para tomar sua decisão.",
        "Suas escolhas afetam seu nível de energia, que é essencial para a sua sobrevivência."
    ]
    
    
  
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
                                Image(systemName: "info.circle")
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
                                .frame(height: 600)
                            
                            VStack (spacing: 20) {
                                Text("TUTORIAL")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("Objetivo:")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("Sobreviva a Era Mesozoica assumindo o papel de um dinossauro diferente a cada rodada!\n\nVocê vencerá ao fazer escolhas que estejam alinhadas com o comportamento típico do seu dinossauro.")
                                
                                Text("Como Funciona:")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                                                
                                Text("Importante!")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("Quer saber com qual dinossauro está jogando e ver mais informações sobre ele? Toque no ícone de ovo no canto superior direito da tela para abrir a sua coleção de dinossauros.")
                                   
                            }
                            .foregroundStyle(.lightBackground)
                            .padding()
                        }
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
}

#Preview {
    TutorialView()
}
