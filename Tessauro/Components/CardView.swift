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
    
    init(scenery: String, scene: String, option1: String, option2: String, imgWidth: CGFloat, imgHeight: CGFloat, decision: Binding<Int>, isDone: Binding<Bool>) {
        self.scenery = scenery
        self.scene = scene
        self.option1 = option1
        self.option2 = option2
        self.imgWidth = imgWidth
        self.imgHeight = imgHeight
        self._decision = decision
        self._isDone = isDone
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color.brownBackground
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            HStack {
                                Image(systemName: "flame.fill")
                                    .font(.title)
                                    .foregroundColor(.orangeBright)
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 180, height: 14)
                                    .foregroundColor(.lightBackground)
                            }
                            Spacer()
                            NavigationLink {
                                DinodexView()
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 40, height: 45)
                                        .foregroundColor(.accentColor)
                                    Image("dino.egg")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
                            }
                        }.padding(20)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                                .foregroundColor(.brownSecondary)
                            VStack {
                                Text(scenery)
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.25)
                                    .foregroundColor(.lightBackground)
                                    .fontWeight(.bold)
                                    .padding(.bottom)
                                    .multilineTextAlignment(.center)
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.lightBackground)
                                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                                    Image(scene)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.35)
                                }
                            }
                        }
                        HStack {
                            Button(action: {
                                decision = 1
                                isDone.toggle()
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
