import SwiftUI

struct CardView: View {
    
    var scenery: String
    var scene: String
    var option1: String
    var option2: String
    var imgWidth: CGFloat
    var imgHeight: CGFloat
    
    @Binding var decision: Int
    @Binding var isDone: Bool
    @Binding var flip:Bool
    
    init(scenery: String, scene: String, option1: String, option2: String, imgWidth: CGFloat, imgHeight: CGFloat, decision: Binding<Int>, isDone: Binding<Bool>, flip:Binding<Bool>) {
        self.scenery = scenery
        self.scene = scene
        self.option1 = option1
        self.option2 = option2
        self.imgWidth = imgWidth
        self.imgHeight = imgHeight
        self._decision = decision
        self._isDone = isDone
        self._flip = flip
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color.brownSecondary
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                DinodexView()
                            } label: {
                                ZStack {
                                    if geometry.size.height < 800 {
                                        ZStack {
                                            Circle()
                                                .frame(width: 40, height: 45)
                                                .foregroundColor(.accentColor)
                                            Image("dino.egg")
                                                .font(.title)
                                                .foregroundColor(.black)
                                        }
                                    } else {
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.accentColor)
                                        Image("dino.egg")
                                            .font(.largeTitle)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }.padding(.trailing)
                        
                        
                        // responsividade do texto de cenário com geometry reader
                        if geometry.size.height < 800 {
                            Text(scenery)
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.25) // multiplicar pela porcentagem da tela
                                .foregroundColor(.lightBackground)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        } else {
                            Text(scenery)
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.25)
                                .foregroundColor(.lightBackground)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                        }
                        
                        // responsividade do card branco de cena ?
                        ZStack {
                            
                            CardFlip(scene: scene, flip:flip)
                                .rotation3DEffect(.degrees(flip ? 0 : -90), axis: (x: 0, y: 1, z: 0))
                                .animation(flip ? .linear.delay(0.35) : .linear, value: flip)
                            CardFlip(scene: scene, flip:flip)
                                .rotation3DEffect(.degrees(flip ? 90 : 0), axis: (x: 0, y: 1, z: 0))
                                .animation(flip ? .linear.delay(0.35) : .linear, value: flip)
                            
                                .padding(.bottom, 35)
                        }
                        
                        HStack {
                            Button(action: {
                                decision = 1
                                isDone.toggle()
                                flip.toggle()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: 150, height: 50)
                                    
                                    Text(option1)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                            })
                            
                            Spacer()
                            Button(action: {
                                decision = -1
                                isDone.toggle()
                                flip.toggle()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
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
    }
}
