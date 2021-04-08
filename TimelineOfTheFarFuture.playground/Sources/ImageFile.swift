import SwiftUI

struct ImageFile: View {
    let named: String
    var body: some View {
        Image(uiImage: UIImage(named: named)!)
            .resizable()
            .scaledToFit()
    }
}
