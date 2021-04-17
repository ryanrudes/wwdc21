import SwiftUI
import AVFoundation

public struct MainScreen: View {
    @Binding var showingHelp: Bool
    @Binding var playing: Bool
    @Binding var page: Page
    
    @State var category: Category = .all
    @State var search = ""
    
    public init(showingHelp: Binding<Bool>, playing: Binding<Bool>, page: Binding<Page>) {
        self._showingHelp = showingHelp
        self._playing = playing
        self._page = page
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                HStack {
                    SearchBar(text: $search)
                    CategoryMenu(category: $category)
                }
                
                List {
                    ForEach(Array(events.enumerated()), id: \.offset) { index, event in
                        if matchesQuery(query: search, event: event) {
                            EventBlob(event: event,
                                      rotating: false,
                                      color: progress2color(progress: Double(index) / Double(events.count)))
                        }
                    }
                }
                .resignKeyboardOnDragGesture()
                .environment(\.defaultMinListRowHeight, 150)
                .transition(.move(edge: .bottom))
                .animation(.spring())
            }
            .padding(.horizontal)
            .navigationTitle(String(describing: category).capitalized)
            .navigationBarItems(
                leading:
                    HStack {
                        OutlinedButton(action: {
                            showingHelp = true
                            page = .help
                        }, image: "questionmark.circle.fill")
                        
                        OutlinedButton(action: {
                            playing.toggle()
                            playing.toggle()
                        }, image: playing ? "speaker.wave.2.circle.fill" : "speaker.slash.circle.fill")
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.dark)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                playing = true
            }
        }
    }
    
    func matchesQuery(query: String, event: Event) -> Bool {
        return (category == .all || event.kind == category) && (search == "" || event.info.localizedCaseInsensitiveContains(query) || event.time.contains(query))
    }
}
