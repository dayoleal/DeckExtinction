import SwiftUI

struct CardFlip: View {
    
    var scene: String
    @State var flip : Bool
    //@State var cardSelected = 0
    
    init(scene: String, flip:Bool) {
        self.scene = scene
        self.flip = flip
    }
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                if geometry.size.height < 800 {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.lightBackground)
                        .frame(width: geometry.size.width * 0.65, height: geometry.size.height * 0.55)
                } else {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.lightBackground)
                        .frame(width: geometry.size.width * 0.83, height: geometry.size.height * 0.45)
                }
                Image(scene)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.4)
            }
        }
        
    }
}
//#Preview {
//    CardFlip(scene: "landscape", flip: false)
//}
