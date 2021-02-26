//
//  FoodModel.swift
//  Model-JsonText
//
//  Created by Shinichiro Kudo on 2021/02/26.
//

import Foundation


struct Food: Codable {
    
    let name: String
    let price: Int
    
}



let jsonStr = """
    [
        { "name": "Apple",      "price": 200 },
        { "name": "Orange",     "price": 120 },
        { "name": "Banana",     "price": 65 },
        { "name": "Grape",      "price": 400 },
        { "name": "Strawberry", "price": 600 },
        { "name": "Chocolate",  "price": 100 },
        { "name": "Candy",      "price": 20 },
        { "name": "Biscuit",    "price": 70 },
        { "name": "Water",      "price": 100 },
        { "name": "Tea",        "price": 200 },
        { "name": "Cola",       "price": 150 },
        { "name": "Beer",       "price": 300 },
        { "name": "Wine",       "price": 500 },
    ]
"""

let jsonData = jsonStr.data(using: .utf8)  // json文字列をデータ型に変換

// 受け取ったdataをJSONDecoder()のdecodeメソッドでswiftの形式に変換(struct) 変換先は配列型なので[Food].selfとしている
let foods = try! JSONDecoder().decode([Food].self, from: jsonData!)


