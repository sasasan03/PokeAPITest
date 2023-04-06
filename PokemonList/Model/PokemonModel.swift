//
//  PokemonData.swift
//  PokemonList
//
//  Created by sako0602 on 2023/03/27.
//

import Foundation
//ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//ポケモンのデータ構造
struct Pokemon: Decodable, Identifiable {
    var id: String { name }
    //ポケモンの名前
    let name: String
    //ポケモンの画像
    let sprites: Sprites?
}

//画像データの構造
struct Sprites: Decodable {
    //古いポケモンの後ろ姿の画像（緑・青・赤）
    let backDefault: URL

    //デコード時のケースをbackDefaultに設定
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
    }
}
