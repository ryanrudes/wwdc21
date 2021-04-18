import SwiftUI

struct LaunchScreen: View {
    @State var width = CGFloat.zero
    @State var category: Category = .astronomy
    @State var rotating = false
    @State var fadeOut = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke()
                .foregroundColor(.gray)
                .scaledToFit()
                .frame(width: width)
                .animation(.spring())
            
            Circle()
                .stroke()
                .foregroundColor(.clear)
                .scaledToFit()
                .frame(width: 170 - width)
                .animation(.spring())
            
            ImageFile(named: category.rawValue)
                .padding(10)
                .background(category2color[category].opacity(0.4).background(Color.white))
                .clipShape(Circle())
                .frame(width: 150)
                .shadow(color: category2color[category]!, radius: 35)
        }
        .opacity(fadeOut ? 0 : 1)
        .animation(.spring())
        .onAppear {
            animate()
        }
        .preferredColorScheme(.dark)
    }
    
    func animate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            width = 170
            playSound(sound: "launch-1", type: "wav", volume: 1.0)
        }
        
        Category.allCases[1...Category.allCases.count - 2].enumerated().forEach { index, category in
            DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(250 * index) + 2) {
                withAnimation(.easeInOut(duration: 0.05)) {
                    fadeOut.toggle()
                    self.category = category
                    fadeOut.toggle()
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeOut(duration: 2)) {
                fadeOut.toggle()
            }
        }
    }
}
