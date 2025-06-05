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
        ZStack {
            Color.brownBackground
                .ignoresSafeArea()
            
            VStack {
                HStack {
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
                Button(action: {
                    dinodexView()
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
