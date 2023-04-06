//
//  ContentView.swift
//  PokemonList
//
//  Created by sako0602 on 2023/03/13.
//

import SwiftUI

struct PokmonListView: View {
    
    @StateObject var pokemonListData = PokemonViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemonListData.pokemons) { pokemon in
                    PokemonRowView(pokemon: pokemon)
                }
            }
            .task {
                pokemonListData.loadPokemons()
            }
            .navigationTitle("PokeAPI")
        }
    }
}


struct PokmonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokmonListView()
    }
}
