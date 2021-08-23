//
//  ContentView.swift
//  Lugha
//
//  Created by Michael Amiro on 21/08/2021.
//

import SwiftUI
import CoreData

struct LessonListView: View {
    @State private var language = "English"
    var lessons = [
        "Simple Title",
        "Possibilities"
    ]
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 5, content: {
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
