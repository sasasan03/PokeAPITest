//
//  PokeData.swift
//  PokemonList
//
//  Created by sako0602 on 2023/03/13.
//

import Foundation
//
//struct PokemonData: Identifiable, Hashable {
//    let id = UUID()
//    let dicId: Int
//    var name: String
//    var image: String?
//}
//
//// ポケモンのデータ構造
//struct Pokemon: Decodable, Hashable {
//static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
//lhs.id == rhs.id
//}
//// ポケモンの名前
//let name: String
//// ポケモンの図鑑No.
//let id: Int
//// ポケモンの画像
//let sprites: Image
//// ポケモンのタイプ
//let types: [TypeEntry]
//}
//
//// 画像のデータ構造
//struct Image: Decodable, Hashable {
//// ポケモンが正面向きの画像
//let frontImage: String
//
//// デコードの際の代替キーをfrontImageプロパティにセット
//enum CodingKeys: String, CodingKey {
//case frontImage = "front_default"
//}
//}
//
//// ポケモンのタイプ
//struct TypeEntry: Decodable, Hashable {
//let type: Mode
//}
//
//// "Type"が命名で利用できず、他に適切な表現が思い浮かばなかった。
//struct Mode: Decodable, Hashable {
//let name: String
//}
//
//class PokemonViewModel: ObservableObject {
//    @Published var pokemons:[PokemonData] = []
//
//    @MainActor func fetchPokemonData() async {
//        do {
//            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/1/") else { return }
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let pokemonF = try JSONDecoder().decode(PokemonData.self, from: data)
//            pokemons.append(pokemonF)
//        } catch {
//            print("Error")
//        }
//    }
//}
//
//
//
//
//
////Userを内包している記事データ
////struct PokeData: Decodable, Identifiable {
////    let id = UUID()
////
////    let title: String
////    let createdAt: String
////    let url: URL
////    let user: User //入れ子になったものは使える
//
////    enum  CodingKeys: String, CodingKey {
////        case title
////        case createdAt = "created_at"//これで対応付けができる
////        case url
////        case user
////    }
////}
////userdataを取り出すための構造体
////struct User: Decodable {
////    let name: String
////    let profileImageURL: URL
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        //Jsonの場合はこんな感じ
//        case profileImageURL = "profile_image_url"
//    }
//}
