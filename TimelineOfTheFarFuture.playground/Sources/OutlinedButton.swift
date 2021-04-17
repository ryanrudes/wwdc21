import SwiftUI

struct OutlinedButton: View {
    let action: () -> Void
    let image: String
    
    var body: some View {
        Button(action: action) {
            Image(systemName: image)
                .foregroundColor(Color(UIColor.systemGray3))
                .imageScale(.large)
                .background(Color.white)
                .clipShape(Circle())
        }
    }
}
