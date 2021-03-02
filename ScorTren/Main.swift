//
//  Main.swift
//  ScorTren
//
//  Created by Sofi on 16.02.2021.
//

import SwiftUI




struct Vue:View {
    @State var items = 0
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("ba"))
    }
    var body: some View{
        TabView{
            Main().tabItem { VStack{
                Image("ho")
                Text("Home")
            } }.tag(0)
            SleepMusic().tabItem { VStack{
                Image("mo")
                Text("Sleep")
            } }.tag(1)
            Main().tabItem { VStack{
                Image("gr")
                Text("Meditate")
            } }.tag(2)
            Main().tabItem { VStack{
                Image("mu")
                Text("Music")
            } }.tag(3)
            Main().tabItem { VStack{
                Image("pro")
                Text("Afsar")
            } }.tag(4)
        }.accentColor(.white)
    }
}

struct Main: View {
    var columns: [GridItem] =
        Array(repeating: .init(.fixed(190)), count: 2)
    @ObservedObject var pin = b()
    @State var show = false
    @State var p:V!
    var body: some View {
        ZStack{
            Color("ba")
            VStack{
                Image("t")
                Spacer()
            }
            VStack{
                Text("Sleep Stories").font(.custom("", size: 28)).foregroundColor(Color("te")).padding()
                Text("Soothing bedtime stories to help you fall \n       into a deep and natural sleep").font(.custom("", size: 16)).foregroundColor(Color("te"))
                ScrollView(.horizontal){
                    HStack(spacing:20){
                        VStack{
                            ZStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width: 65, height: 65, alignment: .center).foregroundColor(Color("bu"))
                                Image("a")
                            }
                            Text("All").font(.custom("", size: 16)).foregroundColor(Color("te"))
                        }
                        VStack{
                            ZStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width: 65, height: 65, alignment: .center).foregroundColor(Color("bu"))
                                Image("h")
                            }
                            Text("My").font(.custom("", size: 16)).foregroundColor(Color("te"))
                        }
                        VStack{
                            ZStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width: 65, height: 65, alignment: .center).foregroundColor(Color("bu"))
                                Image("s")
                            }
                            Text("Anxious").font(.custom("", size: 16)).foregroundColor(Color("te"))
                        }
                        VStack{
                            ZStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width: 65, height: 65, alignment: .center).foregroundColor(Color("bu"))
                                Image("m")
                            }
                            Text("Sleep").font(.custom("", size: 16)).foregroundColor(Color("te"))
                        }
                        VStack{
                            ZStack{
                            RoundedRectangle(cornerRadius: 25.0).frame(width: 65, height: 65, alignment: .center).foregroundColor(Color("bu"))
                                Image("k")
                            }
                            Text("Kids").font(.custom("", size: 16)).foregroundColor(Color("te"))
                        }
                    }
                }.padding(.leading,26).padding(.vertical)
                ZStack{
                    Image("thth")
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(.white).opacity(0.2).frame(width: 30, height: 30, alignment: .center)
                            Image("z")
                            }
                            Spacer()
                        }.offset(x: 30)
                        
                        Text("The ocean moon").font(.custom("", size: 36)).foregroundColor(Color("te")).padding()
                        Text("Non-stop 8- hour mixes of our\n   most popular sleep audio").font(.custom("", size: 16)).foregroundColor(Color("te"))
                        Text("START").font(.custom("", size: 12)).foregroundColor(Color("ba")).background(RoundedRectangle(cornerRadius: 25.0).frame(width: 70, height: 35, alignment: .center).foregroundColor(Color("te"))).padding()
                        
                    }
                }
                ScrollView(.vertical){
                    LazyVGrid(columns: columns, spacing:20){
                        ForEach(pin.pin, id:\.self){i in
                            Button(action: {
                                show.toggle()
                                p = i
                            }, label: {
                                VStack(alignment:.leading){
                                Image(i.image)
                                    Text("\(i.name)").font(.custom("", size: 18)).foregroundColor(Color("te"))
                                    HStack{
                                        Text("45 MIN").font(.custom("", size: 11)).foregroundColor(Color("te2"))
                                        Circle()
                                            .foregroundColor(Color("te2")).frame(width: 3, height: 3, alignment: .center)
                                        Text("SLEEP MUSIC").font(.custom("", size: 11)).foregroundColor(Color("te2"))
                                    }
                                }
                            })
                          
                            
                        }
                    }
                }.padding()
               
                Spacer()
            }.offset( y: 50)
            GeometryReader{ i in
                if show{
                    Play( show: $show, p: p)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Vue()
    }
}




struct V:Hashable {
    var image:String
    var name:String
}


class b: ObservableObject {
    @Published var pin: [V] = []
    init() {
        pin.append(V(image: "im1", name: "Night Island"))
        pin.append(V(image: "im2", name: "Sweet Sleep"))
        pin.append(V(image: "im2", name: "Swee Sleep"))
        pin.append(V(image: "im2", name: "Sweet Slee"))
    }
}
