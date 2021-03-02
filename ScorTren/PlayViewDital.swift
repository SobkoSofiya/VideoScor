//
//  PlayViewDital.swift
//  ScorTren
//
//  Created by Sofi on 16.02.2021.
//

import SwiftUI
import  AVKit

struct PlayViewDital: View {
    @State var time:CGFloat = 0
    
    @State var timeEnd:Double = 0
    @State var timeNow:Double = 0
    @State var player: AVAudioPlayer!
    @State var pla = true
    @State var pin:V2
    @Binding var sh:Bool
//    @State var pl: AVPlayer!
    var body: some View {
        ZStack{
            Color("ba")
            Image("fore")
            VStack{
               
                    HStack{
                       
                        Image("kr").background(Circle().frame(width: 55, height: 55, alignment: .center    ).foregroundColor(Color("te").opacity(0.9))).padding(40).onTapGesture(perform: {
                            sh.toggle()
                        })
                      
                      
                        Spacer()
                        Image("ha").background(Circle().frame(width: 55, height: 55, alignment: .center    ).foregroundColor(.black).opacity(0.4))
                        Image("d").background(Circle().frame(width: 55, height: 55, alignment: .center    ).foregroundColor(.black).opacity(0.4)).padding(40)
                      
                    }.offset( y: 220)
                VStack{
                    if pin.mp == "mp4"{
                        Vidi(pla: $pla).frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center).onReceive(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Publisher@*/NotificationCenter.default.publisher(for: .NSCalendarDayChanged)/*@END_MENU_TOKEN@*/, perform: { _ in
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=code@*/ /*@END_MENU_TOKEN@*/
                        })
                    }
                    Text("\(pin.name)").font(.custom("", size: 34)).foregroundColor(Color("te")).padding()
                Text("SLEEP MUSIC").font(.custom("", size: 14)).foregroundColor(Color("te2"))
                    HStack(spacing:50){
                        Button(action: {
                            if pin.mp == "mp3"{
                            player.currentTime-=15
                            }
                        }, label: {
                            Image("n15")
                        })
                        
                      
                        Button(action: {
                            pla.toggle()
                            if pin.mp == "mp3"{
                            if pla{
                                self.player.play()
                                
                                DispatchQueue.global(qos: .background).async {
//
                                    while true{
                                        let screenWidth :CGFloat = 333
                                        
                                        let currenttime = self.player.currentTime/self.player.duration
                                        timeNow = player.currentTime
//                                        *2.5/15*100
                                        timeEnd = player.duration/60
                                        let timeForLabel = CGFloat(currenttime) * screenWidth
                                        
                                        
                                        self.time = timeForLabel
                                       
                                        
                                    }
                                    
                                    
                                }
                                
                                
                            } else{
                                self.player.stop()
                            }
                            }
                        }, label: {
                            ZStack{
                                Circle()
                                    .frame(width: 109, height: 109, alignment: .center)
                                    .foregroundColor(Color("te")).opacity(0.4)
                                Circle()
                                    .frame(width: 87, height: 87, alignment: .center)
                                    .foregroundColor(Color("te"))
                                Image(systemName: pla ? "pause.fill" : "play.fill" ).resizable().frame(width: 19, height: 19, alignment: .center)
                                    .foregroundColor(Color("ba"))
                            }
                        })
                       
                        Image("v15").onTapGesture(perform: {
                            if pin.mp == "mp3"{
                            player.currentTime+=15
                            }
                        })
                    }.padding(50)
                    ZStack(alignment:.leading){
                        RoundedRectangle(cornerRadius: 25.0).frame(width: 333, height: 3, alignment: .center).foregroundColor(Color("te").opacity(0.2))
                        ZStack(alignment:.trailing){
                            RoundedRectangle(cornerRadius: 25.0).frame(width: time > 15 ?  time : 15, height: 3, alignment: .center).foregroundColor(Color("te"))
//
                            ZStack{
                                Circle()
                                    .frame(width: 17, height: 17, alignment: .center).foregroundColor(Color("bu")).opacity(0.4)
                                Circle()
                                    .frame(width: 13, height: 13, alignment: .center).foregroundColor(Color("bu"))
                            }.offset(x: 5)
                        }
                    }
                    HStack{
                        Text("\(timeNow)").foregroundColor(Color("te")).font(.custom("", size: 16)).padding(.horizontal)
                        Spacer()
                        Text("\(timeEnd)").foregroundColor(Color("te")).font(.custom("", size: 16)).padding(.horizontal)
                    }
                }.offset(y: 200)
                Spacer()
                
                
            }.offset( y: -200)
        }.edgesIgnoringSafeArea(.all)
        .onAppear{
            if pin.mp == "mp3"{
            let url = Bundle.main.path(forResource: "\(pin.audio)", ofType: "\(pin.mp)")
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            }
//            pl =  AVPlayer(url: URL(fileURLWithPath: url!))
//            pl.play()
//            pl = try! AVVideoComposition(propertiesOf: AVAsset(url: URL(string: url!)!))
        }
    }
}

//struct PlayViewDital_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayViewDital(pin: <#T##V2#>, sh: <#T##Binding<Bool>#>)
//    }
//}
//
//struct k:View {
////    @State var pl: AVPlayer!
////    @State var pin:V2
//    var body: some View{
//        ZStack{
//            Vidi()
//        }.onAppear(perform: {
////            let url = Bundle.main.path(forResource: "\(pin.audio)", ofType: "\(pin.mp)")
////            pl =  AVPlayer(url: URL(fileURLWithPath: url!))
////            pl.play()
//        })
//    }
//}


//
struct Vidi:UIViewControllerRepresentable {
//    @State var pin:V2

    @Binding var pla:Bool
    func makeUIViewController(context: UIViewControllerRepresentableContext<Vidi>) ->  AVPlayerViewController{
        let controller = AVPlayerViewController()
        let url = Bundle.main.path(forResource: "video", ofType: "mp4")
        let Vi1 = AVPlayer(url: URL(fileURLWithPath: url!))
        controller.player = Vi1
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<Vidi>) {
        if pla{
            uiViewController.player?.play()
          print("url")
        } else{
            uiViewController.player?.pause()
            print("dfgh")
        }
    }

}
