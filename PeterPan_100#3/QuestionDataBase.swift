//
//  QuestionDataBase.swift
//  PeterPan_100#3
//
//  Created by 林伯翰 on 2019/10/22.
//  Copyright © 2019 林伯翰. All rights reserved.
//
import SwiftUI

struct QuestionFormat{
    var qus: String
    var ans: String
    var imageName: String
    
}
    func imageNameArray(ImageNum: Int) ->String{
        var imageNameAry = [String]()
        let strName = ["Tarot","Wands","Cups","Swords","Pents"]
        for it in strName{
            if it == "Tarot"{
                for item in 0...21{
                    if item <= 9 {
                        imageNameAry.append("\(it)0\(item)")
                    }else{
                        imageNameAry.append("\(it)\(item)")
                    }
                }
            }else{
                for item in 1...14{
                    if item <= 9 {
                        imageNameAry.append("\(it)0\(item)")
                    }else{
                        imageNameAry.append("\(it)\(item)")
                    }
                }
                
            }
        }
        if !imageNameAry.isEmpty && ImageNum <= arcanaCht.count{
            return "\(imageNameAry[ImageNum])"
        }else if ImageNum == 99{
            return "tarotBackSide"
        }else{
            return "Tarot00"
        }
        
    }
    func ArcanaArray(_ randomNum: Int,langIsCht: Bool) -> String{
        if randomNum == 99 {
            return "???"
        }else if langIsCht{
            return arcanaCht[randomNum.self]
        }else{
            return arcanaEng[randomNum.self]
        }
    
    }
    
    
    let arcanaCht = ["愚者","魔術師","女祭司","皇后","皇帝","教皇","戀人","戰車","力量","隱士","命運之輪","正義","吊人","死神","節制","惡魔","高塔","星星","月亮","太陽","審判","世界","權杖一","權杖二","權杖三","權杖四","權杖五","權杖六","權杖七","權杖八","權杖九","權杖十","權杖侍者","權杖騎士","權杖王后","權杖國王","聖杯一","聖杯二","聖杯三","聖杯四","聖杯五","聖杯六","聖杯七","聖杯八","聖杯九","聖杯十","聖杯侍者","聖杯騎士","聖杯王后","聖杯國王","寶劍一","寶劍二","寶劍三","寶劍四","寶劍五","寶劍六","寶劍七","寶劍八","寶劍九","寶劍十","寶劍侍者","寶劍騎士","寶劍王后","寶劍國王","錢幣一","錢幣二","錢幣三","錢幣四","錢幣五","錢幣六","錢幣七","錢幣八","錢幣九","錢幣十","錢幣侍者","錢幣騎士","錢幣王后","錢幣國王"]
    let arcanaEng = ["The Fool","The Magician","The High Priestess","The Empress","The Epmeror","The Hierophant","The Lovers","The Chariot","Strength","The Hermit","The Wheel Of Fortune","Justice","The Hanged Man","Death","Temperance","The Devil","The Tower","The Star","The Moon","The Sun","Judgement","The World","Ace Of Wands","Two Of Wands","Three Of Wands","Four Of Wands","Five Of Wands","Six Of Wands","Seven Of Wands","Eight Of Wands","Nine Of Wands","Ten Of Wands","Page Of Wands","Knight Of Wands","Queen Of Wands","King Of Wands","Ace Of Cups","Two Of Cups","Three Of Cups","Four Of Cups","Five Of Cups","Six Of Cups","Seven Of Cups","Eight Of Cups","Nine Of Cups","Ten Of Cups","Page Of Cups","Knight Of Cups","Queen Of Cups","King Of Cups","Ace Of Swords","Two Of Swords","Three Of Swords","Four Of Swords","Five Of Swords","Six Of Swords","Seven Of Swords","Eight Of Swords","Nine Of Swords","Ten Of Swords","Page Of Swords","Knight Of Swords","Queen Of Swords","King Of Swords","Ace Of Pentacles","Two Of Pentacles","Three Of Pentacles","Four Of Pentacles","Five Of Pentacles","Six Of Pentacles","Seven Of Pentacles","Eight Of Pentacles","Nine Of Pentacles","Ten Of Pentacles","Page Of Pentacles","Knight Of Pentacles","Queen Of Pentacles","King Of Pentacles"]
    
    
    

    
    var arcanaDic = [
    "The Fool":"愚者",
    "The Magician":"魔術師",
    "The High Priestess":"女祭司",
    "The Empress":"皇后",
    "The Epmeror":"皇帝",
    "The Hierophant":"教皇",
    "The Lovers":"戀人",
    "The Chariot":"戰車",
    "Strength":"力量",
    "The Hermit":"隱士",
    "The Wheel Of Fortune":"命運之輪",
    "Justice":"正義",
    "The Hanged Man":"吊人",
    "Death":"死神",
    "Temperance":"節制",
    "The Devil":"惡魔",
    "The Tower":"高塔",
    "The Star":"星星",
    "The Moon":"月亮",
    "The Sun":"太陽",
    "Judgement":"審判",
    "The World":"世界",
    "Ace Of Wands":"權杖一",
    "Two Of Wands":"權杖二",
    "Three Of Wands":"權杖三",
    "Four Of Wands":"權杖四",
    "Five Of Wands":"權杖五",
    "Six Of Wands":"權杖六",
    "Seven Of Wands":"權杖七",
    "Eight Of Wands":"權杖八",
    "Nine Of Wands":"權杖九",
    "Ten Of Wands":"權杖十",
    "Page Of Wands":"權杖侍者",
    "Knight Of Wands":"權杖騎士",
    "Queen Of Wands":"權杖王后",
    "King Of Wands":"權杖國王",
    "Ace Of Cups":"聖杯一",
    "Two Of Cups":"聖杯二",
    "Three Of Cups":"聖杯三",
    "Four Of Cups":"聖杯四",
    "Five Of Cups":"聖杯五",
    "Six Of Cups":"聖杯六",
    "Seven Of Cups":"聖杯七",
    "Eight Of Cups":"聖杯八",
    "Nine Of Cups":"聖杯九",
    "Ten Of Cups":"聖杯十",
    "Page Of Cups":"聖杯侍者",
    "Knight Of Cups":"聖杯騎士",
    "Queen Of Cups":"聖杯王后",
    "King Of Cups":"聖杯國王",
    "Ace Of Swords":"寶劍一",
    "Two Of Swords":"寶劍二",
    "Three Of Swords":"寶劍三",
    "Four Of Swords":"寶劍四",
    "Five Of Swords":"寶劍五",
    "Six Of Swords":"寶劍六",
    "Seven Of Swords":"寶劍七",
    "Eight Of Swords":"寶劍八",
    "Nine Of Swords":"寶劍九",
    "Ten Of Swords":"寶劍十",
    "Page Of Swords":"寶劍侍者",
    "Knight Of Swords":"寶劍騎士",
    "Queen Of Swords":"寶劍王后",
    "King Of Swords":"寶劍國王",
    "Ace Of Pentacles":"錢幣一",
    "Two Of Pentacles":"錢幣二",
    "Three Of Pentacles":"錢幣三",
    "Four Of Pentacles":"錢幣四",
    "Five Of Pentacles":"錢幣五",
    "Six Of Pentacles":"錢幣六",
    "Seven Of Pentacles":"錢幣七",
    "Eight Of Pentacles":"錢幣八",
    "Nine Of Pentacles":"錢幣九",
    "Ten Of Pentacles":"錢幣十",
    "Page Of Pentacles":"錢幣侍者",
    "Knight Of Pentacles":"錢幣騎士",
    "Queen Of Pentacles":"錢幣王后",
    "King Of Pentacles":"錢幣國王"
    ]
