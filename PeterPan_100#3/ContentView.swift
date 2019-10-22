//
//  ContentView.swift
//  PeterPan_100#3
//
//  Created by 林伯翰 on 2019/10/22.
//  Copyright © 2019 林伯翰. All rights reserved.
//

import SwiftUI

struct BtnStyle: ViewModifier{
    func body(content: Content) -> some View{
        return content
        .font(.title)
        
        .padding()
        .foregroundColor(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 5))
        .padding(7)
        .background(Color.orange)
        .cornerRadius(38)
        
    }
}
struct LabelStyle: ViewModifier{
    func body(content: Content) -> some View{
        return content
        .font(.title)
        
        .padding()
        .foregroundColor(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 5))
        .padding(7)
        .background(Color.orange)
        .cornerRadius(38)
        
    }
}





struct ContentView: View {
    @State var cycleNum = 0
    @State var answerStrNum = 99
    @State var questionImageNum = 0
    @State var answerImageNum = 99
    @State var randomNum = 0
    @State var choiceNum = [Int]()
    @State var numArray = [Int]()
    var body: some View {
        VStack{
            HStack {
                Text("猜猜我是誰?").modifier(LabelStyle())
                Image(imageNameArray(ImageNum: questionImageNum))
                .resizable()
                .frame(width: 114, height: 200)
                .cornerRadius(1)
                
            }
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    self.resetBtn()
                }) {
                    Text("Reset!")
                        .fontWeight(.bold)
                }.modifier(BtnStyle())
                Spacer()
                //Text("\(choiceStr())").modifier(LabelStyle())
                //Spacer()
            }
            HStack {
                Image(imageNameArray(ImageNum: answerImageNum))
                .resizable()
                .frame(width: 114, height: 200)
                .cornerRadius(1)
                Text("\(ArcanaArray(answerStrNum, langIsCht: true))").modifier(LabelStyle())
            }
            Spacer()
            HStack(alignment: .bottom){
                Button(action: {
                    self.answerBtn()
                }) {
                    Text("Answer")
                        .fontWeight(.bold)
                }.modifier(BtnStyle())
                Spacer()
                Button(action: {
                    self.nextBtn()
                }) {
                    Text("Next")
                        .fontWeight(.bold)
                }.modifier(BtnStyle())
            }
            
        }.background(Image("TarotBackSide").resizable().scaledToFill(), alignment: .center)
        
    }//body End
    func answerBtn(){
        self.answerImageNum = self.randomNum
        self.answerStrNum = self.randomNum
    }
    func nextBtn(){
        if cycleNum == 9{
            cycleNum = 0
        }
        if choiceNum.count < 10 && cycleNum < 10{
            self.choiceNum.append(randomNum)
            choiceAgain()
        }else{
            self.randomNum = choiceNum[cycleNum]
            cycleNum += 1
        }
        self.questionImageNum = self.randomNum
        self.answerImageNum = 99
        self.answerStrNum = 99
         
    }
    func resetBtn(){
        self.choiceNum.removeAll()
    }
    func choiceAgain(){
        let temp = Int.random(in: 0...arcanaCht.count)
        for i in choiceNum{
            if i == temp{
                choiceAgain()
            }else{
                self.randomNum = temp
            }
        }
    }
    func numArrayStr() -> String{
        return "\(self.numArray)"
    }
    func choiceStr() -> String{
        return "\(self.choiceNum)"
    }
    
    
}//ContentView End


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
