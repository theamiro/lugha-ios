//
//  Authentication.swift
//  Lugha
//
//  Created by Michael Amiro on 21/08/2021.
//

import SwiftUI

struct AuthenticationView:View {
    @State private var welcomeText = "Karibu"
    var body: some View {
        VStack(alignment: .center, spacing: 15, content: {
            Image("reading").resizable().scaledToFit().frame(width: 240, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(welcomeText).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).transition(.opacity).id(welcomeText).font(.title)
            Text("Hey. If you're here it means you kinda want to learn your native language or maybe just test out this cool app.").foregroundColor(.black).font(.subheadline).padding([.leading, .trailing], 10).multilineTextAlignment(.center)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Join in the fun")
            }).padding(.horizontal, 36).padding(.vertical, 14).foregroundColor(Color.white).background(Color.black).cornerRadius(50)
        })
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}

