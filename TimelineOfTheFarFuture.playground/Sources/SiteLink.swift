import SwiftUI

struct SiteLink: View {
    let image: String
    let title: String
    let label: String
    let url: String
    let domain: String
    
    var body: some View {
        HStack {
            ImageFile(named: image)
                .padding(5)
                .background(Color.white)
                .clipShape(Circle())
                .frame(width: 35, height: 35)
            Text(title)
            Spacer()
            Menu {
                Link(destination: URL(string: url)!) {
                    Text("Open at \(domain)?")
                    Image(systemName: "link")
                }
            } label: {
                Text(label)
            }
        }
    }
}
