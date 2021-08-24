//
//  LanguageSelectorView.swift
//  Lugha
//
//  Created by Michael Amiro on 23/08/2021.
//

import SwiftUI

struct LanguageSelectorView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    var languages = [Language(id: "47478hfu", name: "Agikuyu", description: "", duration: "30"), Language(id: "4747e8hfu", name: "Maasai", description: "", duration: "30")]
    var body: some View {
        ZStack(alignment: .center) {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 40, content: {
                VStack(alignment: .leading) {
                    Text("Select language").font(.headline).padding()
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(alignment: .leading) {
                                ForEach(languages) { language in
                                    Button(action: {
                                        env.setLanguage(language: language.name)
                                    }, label: {
                                        VStack {
                                            HStack() {
                                                Text(language.name).padding(.horizontal, 15).padding(.vertical, 5)
                                                Spacer()
                                            }
                                            Divider()
                                        }
                                    }).accentColor(.black)
                                }
                            }
                        }
                    )
                }.frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height / 3, alignment: .center).background(Color.white).cornerRadius(16.0)
                Button(action: {
                    withAnimation {
                        env.showLanguagePopup = false
                    }

                }, label: {
                    Image(systemName: "xmark").foregroundColor(.gray).padding().background(Color.white)
                }).clipShape(Circle())
            })
        }
    }
}
struct LanguageSelectorView_Preview: PreviewProvider {
    static var previews: some View {
        LanguageSelectorView().environmentObject(GlobalEnvironment())
    }
}
