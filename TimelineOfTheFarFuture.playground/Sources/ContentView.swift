//
//  ContentView.swift
//  Timeline
//
//  Created by Ryan Rudes on 4/7/21.
//

import SwiftUI
import AVFoundation

public struct ContentView: View {
    @State var category: Category = .all
    @State var filtered: [Event] = events
    @State var showingSheet = false
    @State var playing = true
    @State var search = ""
    @State var isEditing = false
    
    var music: AVAudioPlayer!

    public init() {
        if let musicURL = Bundle.main.url(forResource: "Exoplanet", withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = -1
                music.volume = 0.4
                music.play()
            }
        }
        
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $search,
                          isEditing: $isEditing)
                    .padding(.horizontal)
                
                List {
                    ForEach(Array(filtered.filter({ search.isEmpty ? true : $0.info.localizedCaseInsensitiveContains(search) || $0.time.contains(search)}).enumerated()), id: \.offset) { index, event in
                        EventBlob(event: event,
                                  rotating: false,
                                  color: progress2color(progress: Double(index) / Double(filtered.count)))
                    }
                }
                .animation(.spring())
                .transition(.move(edge: .bottom))
                .listStyle(SidebarListStyle())
                
                if !isEditing {
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
                    .frame(height: 120)
                    .onChange(of: category) { value in
                        filtered = category == .all ? events : events.filter { $0.category == category }
                    }
                    .animation(.spring())
                    .transition(.move(edge: .bottom))
                }
            }
            .navigationTitle(String(describing: category).capitalized)
            .navigationBarItems(
                leading:
                    HStack {
                        Button(action: {
                            showingSheet = true
                        }) {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(Color(UIColor.systemGray3))
                                .imageScale(.large)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            if music.isPlaying {
                                music.stop()
                            } else {
                                music.play()
                            }
                            playing.toggle()
                        }) {
                            Image(systemName: playing ? "speaker.slash.circle.fill" : "speaker.wave.2.circle.fill")
                                .foregroundColor(Color(UIColor.systemGray3))
                                .imageScale(.large)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    },
                trailing:
                    Orbital(category: category,
                            rotating: true)
                    .padding(.top, 100)
                    .scaleEffect(0.6)
            )
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showingSheet) {
            HelpView()
        }
    }
}
