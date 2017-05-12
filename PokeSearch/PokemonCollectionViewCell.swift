//
//  PokemonCollectionViewCell.swift
//  PokeSearch
//
//  Created by Richard Rodriguez on 5/12/17.
//  Copyright © 2017 Richard Rodriguez. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    func configureCell(pokemon: Pokemon) {
        thumbImageView.image = UIImage(named: "\(pokemon.pokeID)")
        nameLabel.text = pokemon.name.capitalized
    }
}
