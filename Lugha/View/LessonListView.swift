//
//  ContentView.swift
//  Lugha
//
//  Created by Michael Amiro on 21/08/2021.
//

import SwiftUI
import CoreData

struct Itemy: Identifiable {
    var id: UUID
    var name: String
    var duration: String
}
class GlobalEnvironment: ObservableObject {
    @Published var language = "Swahili"
    @Published var showLanguagePopup = false
    
    func setLanguage(language: String) {
        self.language = language
        withAnimation {
            self.showLanguagePopup = false
        }
    }
}

struct LessonListView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    @State private var items = [Itemy(id: UUID(), name: "Simple Nouns", duration: "10"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"),Itemy(id: UUID(), name: "Extended Nouns", duration: "5")]
    @State private var showPopup = false
    
    var body: some View {
        ZStack {
            NavigationView{
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    ForEach(items) { item in
                        NavigationLink(
                            destination: Text("Destination \(item.name)"),
                            label: {
                                LessonCardView(item: item)
                            })
                    }
                })
                .navigationBarTitle("\(env.language) Lessons")
                .navigationBarItems(trailing: Button(action: {
                    withAnimation {
                        env.showLanguagePopup = true
                    }
                }, label: {
                    Text(env.language).font(.body).accentColor(.purple)
                }))
            }
            if env.showLanguagePopup {
                LanguageSelectorView()
            }
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView().environmentObject(GlobalEnvironment())
    }
}

struct LessonCardView: View {
    var item: Itemy
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8.0).frame(width: 350.0, height: 120.0, alignment: .center).foregroundColor(.purple)
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text("\(item.name)").foregroundColor(.white).font(.headline)
                Text("Lesson Duration: \(item.duration) minutes").font(.custom("Avenir Next", size: 14.0)).foregroundColor(.white)
                Spacer()
            }).padding()
        }
    }
}
