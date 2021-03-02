//
//  SleepMusic.swift
//  ScorTren
//
//  Created by Sofi on 16.02.2021.
//

import SwiftUI

struct SleepMusic: View {
    var columns: [GridItem] =
        Array(repeating: .init(.fixed(190)), count: 2)
    @ObservedObject var pin = b3()
    @State var pi: V2!
    @State var sh = false
    var body: some View {
        ZStack{
            Color("ba")
            VStack{
                HStack{
                    Image("arr").background(Circle().frame(width: 55, height: 55, alignment: .center    ).foregroundColor(Color("te").opacity(0.9))).padding(40)
                    Text("Sleep Music").font(.custom("", size: 24)).foregroundColor(Color("te")).padding(.leading,50)
                    Spacer()
                    
                }
                ScrollView(.vertical){
                    LazyVGrid(columns: columns, spacing:20){
                        ForEach(pin.pin, id:\.self){i in
                           
                                VStack(alignment:.leading){
                                Image(i.image)
                                    Text("\(i.name)").font(.custom("", size: 18)).foregroundColor(Color("te"))
                                    HStack{
                                        Text("45 MIN").font(.custom("", size: 11)).foregroundColor(Color("te2"))
                                        Circle()
                                            .foregroundColor(Color("te2")).frame(width: 3, height: 3, alignment: .center)
                                        Text("SLEEP MUSIC").font(.custom("", size: 11)).foregroundColor(Color("te2"))
                                    }
                                }.onTapGesture(perform: {
                                    pi = i
                                    sh.toggle()
                                    
                                })
                           
                            
                        }
                        
                    }
                }.padding()
                
                Spacer()
            }.offset(y: 50)
            GeometryReader{ i in
                if pi != nil && sh {
                    PlayViewDital( pin: pi, sh: $sh)
                }
            }
           
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SleepMusic_Previews: PreviewProvider {
    static var previews: some View {
        SleepMusic()
    }
}



struct V2:Hashable, Decodable {
    var image:String
    var name:String
    var audio:String
    var mp:String
}


class b3: ObservableObject {
    @Published var pin: [V2] = []
    init() {
        pin.append(V2(image: "u1", name: "Night Island", audio: "video", mp: "mp4"))
        pin.append(V2(image: "u2", name: "Sweet Sleet", audio: "v2", mp: "mp3"))
        pin.append(V2(image: "u3", name: "Good Night", audio: "video", mp: "mp4"))
        pin.append(V2(image: "u4", name: "Moon Clouds", audio: "v4", mp: "mp3"))
        pin.append(V2(image: "u2", name: "Night Island", audio: "video", mp: "mp4"))
        pin.append(V2(image: "u1", name: "Sweet Sleet", audio: "v1", mp: "mp3"))
        pin.append(V2(image: "u4", name: "Good Night", audio: "v4", mp: "mp3"))
        pin.append(V2(image: "u3", name: "Moon Clouds", audio: "v3", mp: "mp3"))
       
    }
}
