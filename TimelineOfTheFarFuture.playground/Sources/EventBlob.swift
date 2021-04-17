import SwiftUI

struct EventBlob: View {
    @State var showingPage = false
    
    let event: Event
    let rotating: Bool
    let color: Color
    
    var body: some View {
        Button(action: {
            showingPage.toggle()
        }) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    ImageFile(named: event.kind.rawValue)
                        .padding(10)
                        .background(category2color[event.kind].opacity(0.4).background(Color.white))
                        .clipShape(Circle())
                        .frame(width: 150)
                        .shadow(color: category2color[event.kind]!, radius: 35)
                        .scaleEffect(0.7)
                        .frame(width: 50, height: 50)
                    
                    Text(event.time)
                        .foregroundColor(color)
                        .font(.title2)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Text(event.caption)
                    .bold()
            }
        }
        .fullScreenCover(isPresented: $showingPage) {
            InfoView(event: event)
        }
    }
}
