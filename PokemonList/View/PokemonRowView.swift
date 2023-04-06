//
//  PkemonRowView.swift
//  PokemonList
//
//  Created by sako0602 on 2023/03/29.
//

import SwiftUI

struct PokemonRowView: View {
    
    @State var pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.sprites?.backDefault){ image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100)
            Text(pokemon.name)
        }
    }
}

struct Preview: View {
    static var url: URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!
    @State var pokemon = Pokemon(name: "フシギダネ", sprites: Sprites(backDefault: url))
    var body: some View {
        PokemonRowView(pokemon: pokemon)
    }
}

struct PkemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
