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
struct LessonListView: View {
    @State private var items = [Itemy(id: UUID(), name: "Simple Nouns", duration: "10"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"), Itemy(id: UUID(), name: "Extended Nouns", duration: "5"),Itemy(id: UUID(), name: "Extended Nouns", duration: "5")]
    @State private var language = "English"
    var body: some View {
        NavigationView{
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: true, content: {
                ForEach(items) { item in
                    NavigationLink(
                        destination: Text("Destination \(item.name)"),
                        label: {
                            LessonCardView(item: item)
                        })
                }
            })
            .navigationBarTitle("Lessons")
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text(language).font(.caption).accentColor(.purple)
            }))
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView()
    }
}

struct LessonCardView: View {
    var item: Itemy
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8.0).frame(width: 350.0, height: 120.0, alignment: .center).foregroundColor(.purple)
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text("\(item.name)").foregroundColor(.white).font(.headline)
                Text("Lesson Duration: \(item.duration)").font(.custom("Avenir Next", size: 14.0)).foregroundColor(.white)
                Spacer()
            }).padding()
        }
    }
}
