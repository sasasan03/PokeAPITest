//
//  PokemonViewModel.swift
//  PokemonList
//
//  Created by sako0602 on 2023/03/27.
//

import SwiftUI


final class PokemonViewModel: ObservableObject, Identifiable {
    //リスト表示するためのインスタンス
    @Published var pokemons: [Pokemon] = [Pokemon]()
    
//    init(){ //init()することでPokemonListViewへ初期画面を設定することができる。これがあると、PokemonListViewの.onApperがいらない。
//        loadPokemons()
//    }
    //取得してきたデータをpokemonsへ格納するメソッド。
    func loadPokemons() {
        let pokeAPIClient = PokeAPIClient()
        pokeAPIClient.fetch { [weak self] result in //[weak self]をつけて循環参照を防ぐ。
            switch result {
            case .success(let pokemon):
                self?.pokemons.append(pokemon) //weak selfをつけることでself?をつける。
            case .failure(let error):
                print(error)
            }
        }
    }
}
