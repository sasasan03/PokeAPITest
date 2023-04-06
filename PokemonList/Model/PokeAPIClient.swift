//
//  PokemonViewModel.swift
//  PokemonList
//
//  Created by sako0602 on 2023/03/27.
//

import Foundation

//１　getpokemonsが呼ばれる
//２　getURLsからURLを取得
//３　for文で回して一つずつfetchさせる
//４  成功した場合、pokemonListへ格納されていく
//５　

//データのリクエストを送り取得した後、データをデコードする
class PokeAPIClient {
    
    //ポケモン指定した数のデータを返す
    func fetch(completion: @escaping ((Result<Pokemon, APIError>) -> Void)) {
        let urls = getURLs()
        //URLを生成
        urls.forEach { //in
            guard let url = $0 else {
                return  completion(.failure(.invalidURL))
            }
            //Requestを生成
            let request = URLRequest(url: url)
            //非同期で通信を行う。
            URLSession.shared.dataTask(with: request) { (data, _ , error) in
                do {
                    //dataTaskでとってきたdataをアンラップした後にdataへ格納
                    guard let data = data else { throw APIError.networkError }
                    //Pokemon型へデコードしたものをpokemonListへ格納する
                    guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {
                        throw APIError.invalidURL
                    }
                    DispatchQueue.main.async {
                        completion(.success(pokemon))
                    }
                } catch {
                    //🟥エラー処理
                    if error as? APIError == APIError.networkError {
                        completion(.failure(.networkError))
                    } else if error as? APIError == APIError.noneValue {
                        completion(.failure(.noneValue))
                    } else {
                        completion(.failure(.unknown))
                    }
                }
            }
            // 通信を実行
            .resume()
            
        }
    }
    
    //ポケモン151体分のリクエストURLメソッド
    private func getURLs() -> [URL?]{//String] {
//        print(">>>getURLs")
        let pokemonIdRange = 1...151
        let urls = pokemonIdRange.map {
            URL(string: "https://pokeapi.co/api/v2/pokemon/\($0)/")
        }
//        print("<<<getURLs")
        return urls
        
    }
}
