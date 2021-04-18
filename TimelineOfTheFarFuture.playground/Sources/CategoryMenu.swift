import SwiftUI

struct CategoryMenu: View {
    @Binding var category: Category
    @State var rotation = 0.0
    
    var body: some View {
        Menu {
            Picker("", selection: $category) {
                ForEach(Category.allCases, id: \.self) {category in
                    HStack {
                        Text(category2label[category]!)
                        Spacer()
                        ImageFile(named: category.rawValue)
                    }
                    .tag(category)
                }
            }
        }
        label: {
            ImageFile(named: category.rawValue)
                .frame(width: 36, height: 36)
                .rotationEffect(.degrees(rotation))
                .animation(
                    Animation.spring()
                        .delay(5)
                        .repeatForever(autoreverses: true)
                )
                .onAppear {
                    rotation = 360
                }
        }
    }
}
