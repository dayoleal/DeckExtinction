//
//  cardView.swift
//  Tessauro
//
//  Created by Aluno Mack on 02/06/25.
//

import SwiftUI

struct cardView: View {
    var scenery: String
    var scene: String
    var option1: String
    var option2: String
    var imgWidth: CGFloat
    var imgHeight: CGFloat
    
    init(scenery: String, scene: String, option1: String, option2: String, imgWidth: CGFloat, imgHeight: CGFloat) {
        self.scenery = scenery
        self.scene = scene
        self.option1 = option1
        self.option2 = option2
        self.imgWidth = imgWidth
        self.imgHeight = imgHeight
    }
    
    var body: some View {
        ZStack {
            Color.brownBackground
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "flame.fill")
                            .font(.title)
                            .foregroundColor(.orangeBright)
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 180, height: 14)
                            .foregroundColor(.lightBackground)
                    }
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.accentColor)
                        Image(systemName: "person.fill")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }.padding(20)
                
                ZStack {
                    Rectangle()
                        .frame(width: 380, height: 600)
                        .foregroundColor(.brownSecondary)
                    VStack {
                        Text(scenery)
                            .frame(width: 320)
                            .foregroundColor(.lightBackground)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .multilineTextAlignment(.center)
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.lightBackground)
                                .frame(width: 330, height: 350)
                            Image(scene)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: imgWidth, height: imgHeight)
                        }
                    }
                }
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 150, height: 50)

                                Text(option1)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                        }
                    })
                    
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 150, height: 50)
                                Text(option2)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                        }
                    })
                }.padding(20)
            }
        }
    }
}
