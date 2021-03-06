import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let event: Event
    let color: Color!
    
    init(event: Event) {
        self.event = event
        self.color = category2color[event.kind]
    }
    
    var body: some View {
        NavigationView {
            GeometryReader {geometry in
                VStack(alignment: .leading, spacing: 20) {
                    (Text("In ")
                    + Text(event.time)
                        .foregroundColor(self.color)
                        .bold()
                    + Text(" years:")).font(.title)
                        .padding(.top)
                    
                    Text(event.info)
                        .foregroundColor(self.color)
                        .bold()
                    
                    if let url = URL(string: event.link) {
                        WebView(url: url, reader: true)
                            .frame(height: geometry.size.height)
                            .padding(.vertical)
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Text(event.time)
                        .foregroundColor(.black)
                        .bold()
                        .padding(6)
                        .background(self.color)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 15,
                                                    style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 15,
                                                  style: .continuous).stroke()),
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .imageScale(.large)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
            )
        }
        .preferredColorScheme(.dark)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
