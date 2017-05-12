//
//  PokemonSelectionViewController.swift
//  PokeSearch
//
//  Created by Richard Rodriguez on 5/12/17.
//  Copyright © 2017 Richard Rodriguez. All rights reserved.
//

import UIKit

// protocol used for sending data back
protocol DataEnteredDelegate: class {
    func userDidEnterPokemonSelection(pokeID: Int)
}

class PokemonSelectionViewController: UIViewController {
    fileprivate let pokemon: [String] = [
        "bulbasaur",
        "ivysaur",
        "venusaur",
        "charmander",
        "charmeleon",
        "charizard",
        "squirtle",
        "wartortle",
        "blastoise",
        "caterpie",
        "metapod",
        "butterfree",
        "weedle",
        "kakuna",
        "beedrill",
        "pidgey",
        "pidgeotto",
        "pidgeot",
        "rattata",
        "raticate",
        "spearow",
        "fearow",
        "ekans",
        "arbok",
        "pikachu",
        "raichu",
        "sandshrew",
        "sandslash",
        "nidoran-f",
        "nidorina",
        "nidoqueen",
        "nidoran-m",
        "nidorino",
        "nidoking",
        "clefairy",
        "clefable",
        "vulpix",
        "ninetales",
        "jigglypuff",
        "wigglytuff",
        "zubat",
        "golbat",
        "oddish",
        "gloom",
        "vileplume",
        "paras",
        "parasect",
        "venonat",
        "venomoth",
        "diglett",
        "dugtrio",
        "meowth",
        "persian",
        "psyduck",
        "golduck",
        "mankey",
        "primeape",
        "growlithe",
        "arcanine",
        "poliwag",
        "poliwhirl",
        "poliwrath",
        "abra",
        "kadabra",
        "alakazam",
        "machop",
        "machoke",
        "machamp",
        "bellsprout",
        "weepinbell",
        "victreebel",
        "tentacool",
        "tentacruel",
        "geodude",
        "graveler",
        "golem",
        "ponyta",
        "rapidash",
        "slowpoke",
        "slowbro",
        "magnemite",
        "magneton",
        "farfetchd",
        "doduo",
        "dodrio",
        "seel",
        "dewgong",
        "grimer",
        "muk",
        "shellder",
        "cloyster",
        "gastly",
        "haunter",
        "gengar",
        "onix",
        "drowzee",
        "hypno",
        "krabby",
        "kingler",
        "voltorb",
        "electrode",
        "exeggcute",
        "exeggutor",
        "cubone",
        "marowak",
        "hitmonlee",
        "hitmonchan",
        "lickitung",
        "koffing",
        "weezing",
        "rhyhorn",
        "rhydon",
        "chansey",
        "tangela",
        "kangaskhan",
        "horsea",
        "seadra",
        "goldeen",
        "seaking",
        "staryu",
        "starmie",
        "mr-mime",
        "scyther",
        "jynx",
        "electabuzz",
        "magmar",
        "pinsir",
        "tauros",
        "magikarp",
        "gyarados",
        "lapras",
        "ditto",
        "eevee",
        "vaporeon",
        "jolteon",
        "flareon",
        "porygon",
        "omanyte",
        "omastar",
        "kabuto",
        "kabutops",
        "aerodactyl",
        "snorlax",
        "articuno",
        "zapdos",
        "moltres",
        "dratini",
        "dragonair",
        "dragonite",
        "mewtwo",
        "mew"]

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var delegate: DataEnteredDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

// MARK: UICollectionViewDelegateFlowLayout

extension PokemonSelectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
}

// MARK: UICollectionViewDelegate

extension PokemonSelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.userDidEnterPokemonSelection(pokeID: indexPath.row + 1)
        dismiss(animated: true, completion: nil)
    }
}

// MARK: UICollectionViewDataSource

extension PokemonSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell {
            cell.configureCell(pokeID: indexPath.row + 1, name: pokemon[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: 

extension PokemonSelectionViewController: UISearchBarDelegate {
    
}
