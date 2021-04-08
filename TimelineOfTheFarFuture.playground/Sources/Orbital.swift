import SwiftUI

struct Orbital: View {
    let category: Category
    @State var rotating: Bool
    
    // Degrees of rotation
    @State var rotation: Double = 0
    
    // Rotation on axis
    @State var axisX: CGFloat = 0
    @State var axisY: CGFloat = 0
    @State var axisZ: CGFloat = 0
    
    // Direction of spin
    @State var spinX: CGFloat = 1
    @State var spinY: CGFloat = 1
    @State var spinZ: CGFloat = 1
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke()
                .foregroundColor(.gray)
                .scaledToFit()
                .frame(width: rotating ? 170 : 0)
                .animation(.spring())
            
            Circle()
                .stroke()
                .foregroundColor(.clear)
                .scaledToFit()
                .frame(width: rotating ? 0 : 170)
                .animation(.spring())
            
            Button(action: {
                if rotating {
                    withAnimation(nil) {
                        axisX = axisX.truncatingRemainder(dividingBy: 360)
                        axisY = axisY.truncatingRemainder(dividingBy: 360)
                        axisZ = axisZ.truncatingRemainder(dividingBy: 360)
                    }
                    
                    withAnimation(Animation.spring().speed(0.5)) {
                        rotation = 0
                        axisX = 0
                        axisY = 0
                        axisZ = 0
                    }
                }
                rotating.toggle()
            }) {
                ImageFile(named: category.rawValue)
                    .padding(10)
                    .background(category2color[category].opacity(0.4).background(Color.white))
                    .clipShape(Circle())
                    .frame(width: 150)
                    .shadow(color: category2color[category]!, radius: 35)
            }
        }
        .animation(.spring())
        .rotation3DEffect(.degrees(rotation),
                          axis: (x: axisX,
                                 y: axisY,
                                 z: axisZ))
        .onReceive(timer) { time in
            if rotating {
                rotation += 1
                
                axisX += spinX * 2
                axisY += spinY * 2
                axisZ += spinZ * 2
                
                spinX += CGFloat.random(in: -1...1)
                spinY += CGFloat.random(in: -1...1)
                spinZ += CGFloat.random(in: -1...1)
            }
        }
    }
}
