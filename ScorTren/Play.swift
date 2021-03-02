//
//  Play.swift
//  ScorTren
//
//  Created by Sofi on 16.02.2021.
//

import SwiftUI

struct Play: View {
    @ObservedObject var pin = b1()
    var columns: [GridItem] =
        Array(repeating: .init(.fixed(190)), count: 2)
    @Binding var show:Bool
    @State var p:V
    var body: some View {
        ZStack{
            Color("ba")
            VStack{
                ZStack{
                    Image("\(p.image)").resizable().frame(width: UIScreen.main.bounds.width, height: 290, alignment: .center)
                    HStack{
                        Button(action: {
                            show.toggle()
                        }, label: {
                            Image("arr").background(Circle().frame(width: 55, height: 55, alignment: .center    ).foregroundColor(Color("te").opacity(0.9))).padding(40)
                        })
                      
                        Spacer()
                        Image("ha").background(Circle().frame(width: 55, height: 55, alignment: .center    ).foregroundColor(.black).opacity(0.4))
                        Image("d").background(Circle().frame(width: 55, height: 55, alignment: .center    ).foregroundColor(.black).opacity(0.4)).padding(40)
                      
                    }.offset( y: -100)
                }
                VStack(alignment:.leading){
                    Text("\(p.name)").font(.custom("", size: 34)).foregroundColor(Color("te"))
                    HStack{
                        Text("45 MIN").font(.custom("", size: 14)).foregroundColor(Color("te2"))
                        Circle()
                            .foregroundColor(Color("te2")).frame(width: 3, height: 3, alignment: .center)
                        Text("SLEEP MUSIC").font(.custom("", size: 14)).foregroundColor(Color("te2"))
                       
                    }.padding(.vertical)
                    Text("Ease the mind into a restful night’s sleep with \nthese deep, amblent tones.").font(.custom("", size: 16)).foregroundColor(Color("te2"))
                    HStack{
                        HStack{
                            Image("wh")
                            Text("24.234 Favorits").font(.custom("", size: 14)).foregroundColor(Color("te"))
                        }
                        HStack{
                            Image("na")
                            Text("34.234 Lestening").font(.custom("", size: 14)).foregroundColor(Color("te"))
                        }
                    }.padding(.vertical)
                    Rectangle()
                        .frame(width: 374, height: 0.5, alignment: .center).foregroundColor(Color("te")).opacity(0.4)
                    Text("Related").font(.custom("", size: 24)).foregroundColor(Color("te")).padding(.top)
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
                                }
                                
                            }
                        }
                    }.padding().frame(width: UIScreen.main.bounds.width-50, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Text("PLAY").font(.custom("", size: 14)).foregroundColor(Color("te")).background(RoundedRectangle(cornerRadius: 38).frame(width: 374, height: 63, alignment: .center).foregroundColor(Color("bu")))
                Spacer()
                
            }.offset( y: 40)
        }.edgesIgnoringSafeArea(.all)
    }
}

//struct Play_Previews: PreviewProvider {
//    static var previews: some View {
//        Play()
//    }
//}


struct V1:Hashable {
    var image:String
    var name:String
}


class b1: ObservableObject {
    @Published var pin: [V1] = []
    init() {
        pin.append(V1(image: "in1", name: "Moon Clouds"))
        pin.append(V1(image: "in2", name: "Sweet Sleep"))
        pin.append(V1(image: "in1", name: "Swee Sleep"))
        pin.append(V1(image: "in2", name: "Sweet Slee"))
    }
}
