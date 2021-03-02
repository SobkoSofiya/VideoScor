//
//  ContentView.swift
//  ScorTren
//
//  Created by Sofi on 16.02.2021.
//

import SwiftUI

struct ContentView: View {
    @Binding var Swift22:Int
    var body: some View {
        ZStack{
            Color("ba")
            Image("for1")
            VStack{
                Text("Wecome to Sleep").font(.custom("", size: 30)).foregroundColor(Color("te")).padding()
                Text(" Explore the new king of sleep. It uses sound \nand vesualization to create perfect conditions \n                     for refreshing sleep.").font(.custom("", size: 16)).foregroundColor(Color("te"))
                Image("pt").padding(.top,60)
                Spacer()
                Button(action: {
                    Swift22 = 2
                }, label: {
                    Text("GET STARTED").font(.custom("", size: 14)).foregroundColor(Color("te")).background(RoundedRectangle(cornerRadius: 38).frame(width: 374, height: 63, alignment: .center).foregroundColor(Color("bu"))).padding(.bottom,300)
                })
              
                
            }.offset( y: 170)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(Swift22: .constant(1))
    }
}
