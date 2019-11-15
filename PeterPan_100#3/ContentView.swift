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
        .font(.headline)
        
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
    let targetQusNum = 10
    @State var cycleNum = 0
    @State var indexNum = 0
    @State var answerStrNum = 99
    @State var questionImageNum = 0
    @State var answerImageNum = 99
    @State var randomNum = 0
    @State var choiceNum = [Int]()
    //@State var numArray = [Int]()
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text("(\(cycleNumStr()))猜猜我是誰?").modifier(LabelStyle())
                Spacer()
                Image(imageNameArray(ImageNum: questionImageNum))
                    .resizable()
                    .frame(width: 114, height: 200)
                    .cornerRadius(1)
                    .padding(.top, 40)
                Spacer()
                
            }
            Spacer()
            
            HStack {
                Spacer()
                Image(imageNameArray(ImageNum: answerImageNum))
                    .resizable()
                    .frame(width: 114, height: 200)
                    .cornerRadius(1)
                Spacer()
                Text("\(ArcanaArray(answerStrNum, langIsCht: true))").modifier(LabelStyle())
                Spacer()
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
                    self.resetBtn()
                }) {
                    Text("Reset")
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
            
        }.background(Image("tarotBG").resizable().scaledToFill(), alignment: .center)
        
    }//body End
    func answerBtn(){
        self.answerImageNum = self.randomNum
        self.answerStrNum = self.randomNum
    }
    func nextBtn(){
        
        
        if choiceNum.count < targetQusNum{
            self.choiceNum.append(randomNum)
            //print("=count:\(choiceNum.count),randomNum:\(randomNum)==B")
            choiceAgain() //比較是否有相同隨機數

            indexNum += 1
            cycleNum += 1
            //print("=randomNum:\(randomNum)==A")
        }
        
        //print("index:\(indexNum),count:\(choiceNum.count),randomNum:\(randomNum)")
        if indexNum == targetQusNum && choiceNum.count == targetQusNum{
            //print("index:\(indexNum),cyc:\(cycleNum)==B")
            indexNum = 0
            cycleNum = 0
            indexNum += 1
            self.randomNum = self.choiceNum[indexNum-1]
            
            //print("index:\(indexNum),randomNum:\(randomNum),cyc:\(cycleNum)==A")
        }else if indexNum < targetQusNum && choiceNum.count == targetQusNum{
            //print("===index:\(indexNum),randomNum:\(randomNum),cyc:\(cycleNum)===first")
            indexNum += 1
            //print("===index:\(indexNum),randomNum:\(randomNum),cyc:\(cycleNum)===before")
            self.randomNum = self.choiceNum[indexNum-1]
            cycleNum += 1
            //print("===index:\(indexNum),randomNum:\(randomNum),cyc:\(cycleNum)===after")
            
        }
        
        //設定下一張圖片
        self.questionImageNum = self.randomNum
        //print("questionImageNum = \(questionImageNum)")
        //把圖片和文字隱藏
        self.answerImageNum = 99
        self.answerStrNum = 99
        //
    }
    func resetBtn(){
        self.choiceNum.removeAll()
        self.answerImageNum = 99
        self.answerStrNum = 99
        self.indexNum = 0
        self.cycleNum = 0
    }
    func choiceAgain(){
        let temp = Int.random(in: 0...arcanaCht.count-1)
        for i in choiceNum{
            if i == temp{
                choiceAgain()
            }else{
                self.randomNum = temp
            }
        }
    }

    func choiceStr() -> String{
        return "\(self.choiceNum)"
    }
    func cycleNumStr() -> String{
        return "\(self.cycleNum+1)"
    }
    
}//ContentView End


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
