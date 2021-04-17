import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var search = ""
    @State var isEditing = false
    @State var category: Category = .all
    @State var animationAmount = 0.0
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("What is this?")
                            .foregroundColor(.orange)
                            .font(.title2)
                            .bold()
                        
                        Text("Explore a timeline of the distant future. Read projections under various scientific disciplines. These events are not fictional, but rather events that are actually estimated to occur at roughly the indicated time based on scientific law. Events are denoted by an integer indicating the number of years until the respective event occurs. Some events are probabilistic, meaning that they occur under certain circumstances. You can explore the details of each occurance, and for some, a related page is provided with further information regarding the future event.")
                            .bold()
                    }
                    
                    Group {
                        Text("Categories")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .bold()
                        
                        Text("On the main screen, tap the menu icon to the right of the search bar to select an event category. It looks like this:")
                            .bold()
                        
                        HStack {
                            SearchBar(text: $search)
                            
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
                                    .rotationEffect(.degrees(animationAmount))
                                    .animation(
                                        Animation.spring()
                                            .delay(5)
                                            .repeatForever(autoreverses: true)
                                    )
                                    .onAppear {
                                        animationAmount = 360
                                    }
                            }

                        }
                        .padding()
                        
                        Text("There are 6 main categories in which the events are divided into:")
                            .bold()
                        
                        VStack {
                            ForEach(Category.allCases, id: \.self) { category in
                                if category != .all {
                                    HStack {
                                        Text(String(describing: category).capitalized)
                                            .bold()
                                        Spacer()
                                        ImageFile(named: category.rawValue)
                                            .padding(10)
                                            .background(category2color[category].opacity(0.4).background(Color.white))
                                            .clipShape(Circle())
                                            .frame(width: 150)
                                            .scaleEffect(0.7)
                                            .frame(width: 50, height: 50)
                                            .shadow(color: category2color[category]!, radius: 35)
                                    }
                                }
                            }
                        }
                    }
                    
                    Group {
                        Text("You may also choose to look at all categories combined:")
                            .bold()
                        
                        HStack {
                            Text("All")
                                .bold()
                            Spacer()
                            ImageFile(named: "all")
                                .padding(10)
                                .background(category2color[.all].opacity(0.4).background(Color.white))
                                .clipShape(Circle())
                                .frame(width: 150)
                                .scaleEffect(0.7)
                                .frame(width: 50, height: 50)
                                .shadow(color: category2color[.all]!, radius: 35)
                        }
                    }
                    
                    Group {
                        Text("Sources")
                            .foregroundColor(.purple)
                            .font(.title2)
                            .bold()
                        
                        Text("These projections are sourced from the Wikipedia page titled, \"Timeline of the far future\"")
                            .bold()
                        
                        SiteLink(image: "wikipedia",
                                 title: "Wikipedia",
                                 label: "Timeline of the far future",
                                 url: "https://en.wikipedia.org/wiki/Timeline_of_the_far_future",
                                 domain: "wikipedia.org")
                        
                        Text("App icon and other images are derived from icons8.com.")
                            .bold()
                        
                        SiteLink(image: "icons8",
                                 title: "Icons8",
                                 label: "Open icons8.com",
                                 url: "https://icons8.com",
                                 domain: "icons8.com")
                        
                        Text("Background comes from the open domain and is licensed under Creative Commons by its author.")
                            .bold()
                        
                        SiteLink(image: "youtube",
                                 title: "YouTube",
                                 label: "Open music at youtube.com",
                                 url: "https://www.youtube.com/watch?v=wJ98LoSWH-s",
                                 domain: "youtube.com")
                    }
                    
                    Group {
                        Text("About Me")
                            .foregroundColor(.yellow)
                            .font(.title2)
                            .bold()
                        
                        SiteLink(image: "github",
                                 title: "GitHub",
                                 label: "Ryan-Rudes",
                                 url: "https://github.com/Ryan-Rudes",
                                 domain: "github.com")
                        
                        SiteLink(image: "medium",
                                 title: "Medium",
                                 label: "@ryanrudes",
                                 url: "https://ryanrudes.medium.com",
                                 domain: "medium.com")
                        
                        SiteLink(image: "pypi",
                                 title: "PyPI",
                                 label: "ryanrudes",
                                 url: "https://pypi.org/user/ryanrudes",
                                 domain: "pypi.org")
                        
                        SiteLink(image: "person",
                                 title: "Personal Site",
                                 label: "github.io",
                                 url: "https://ryan-rudes.github.io/",
                                 domain: "github.io")
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Help")
            .navigationBarItems(trailing:
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
    }
}
