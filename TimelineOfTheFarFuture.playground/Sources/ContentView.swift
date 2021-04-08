import SwiftUI

public struct ContentView: View {
    @State var category: Category = .all
    @State var filtered: [Event] = events
    @State var showingSheet = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List {
                        ForEach(Array(filtered.enumerated()), id: \.offset) { index, event in
                            EventBlob(event: event,
                                      showCategory: category == .all,
                                      rotating: false,
                                      color: progress2color(progress: Double(index) / Double(filtered.count)))
                        }
                    }
                    Spacer()
                    Picker("Category", selection: $category) {
                        Text("All")
                            .tag(Category.all)
                        Text("Astronomy and Astrophysics")
                            .tag(Category.astronomy)
                        Text("Geology and Planetary Science")
                            .tag(Category.geology)
                        Text("Biology")
                            .tag(Category.biology)
                        Text("Particle Physics")
                            .tag(Category.physics)
                        Text("Mathematics")
                            .tag(Category.math)
                        Text("Technology and Culture")
                            .tag(Category.technology)
                    }
                    .clipped()
                    .frame(height: 100)
                    .onChange(of: category) { value in
                        filtered = category == .all ? events : events.filter { $0.category == category }
                    }
                }
                .navigationTitle(String(describing: category).capitalized)
                .navigationBarItems(leading:
                    Button(action: {
                        showingSheet = true
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(Color(UIColor.systemGray3))
                            .imageScale(.large)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                )
            }
            
            VStack {
                HStack {
                    Spacer()
                    Orbital(category: category,
                            rotating: true)
                        .scaleEffect(0.8)
                }
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showingSheet) {
            HelpView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
