//
//  HelpView.swift
//  Timeline
//
//  Created by Ryan Rudes on 4/8/21.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("What is this?")
                            .foregroundColor(.orange)
                            .font(.title2)
                            .bold()
                        
                        Text("Explore a timeline of the distant future. Read projections under various scientific disciplines. These events are not fictional, but rather events that are actually estimated to occur at roughly the indicated time based on scientific law. Some of the relatively closer events are denoted by a year, e.g. 3015 CE. The others are simply denoted by a number which tells you the number of years before the event takes place, e.g. 250,000.")
                            .bold()
                    }
                    
                    Group {
                        Text("Categories")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .bold()
                        
                        Text("There are 6 main categories in which the events are divided into:")
                            .bold()
                        
                        VStack {
                            ForEach(Category.allCases, id: \.self) { category in
                                if category != .all {
                                    HStack {
                                        Text(String(describing: category).capitalized)
                                            .bold()
                                        Spacer()
                                        Orbital(category: category,
                                                rotating: false)
                                            .scaleEffect(0.7)
                                            .frame(width: 50, height: 50)
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
                            Orbital(category: .all,
                                    rotating: false)
                                .scaleEffect(0.7)
                                .frame(width: 50, height: 50)
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
            }
            .padding(.horizontal)
            .navigationTitle("Help")
            .navigationBarItems(leading:
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
