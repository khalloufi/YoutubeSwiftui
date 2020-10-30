//
//  ContentView.swift
//  YoutubeSwiftui
//
//  Created by issam on 30/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State var action:String = ""
    var body: some View {
        VStack{
            Text("Title")
            YoutubeView(videoId: "L6Sp4Sbxdfw", action: $action).frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width, alignment: .center)
            HStack{
                Button(action: {
                    action = "Play"
                }, label: {
                    Text("Play")
                })
                Button(action: {
                    action = "Pause"
                }, label: {
                    Text("Pause")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
