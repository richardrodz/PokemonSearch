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
    func userDidEnterPokemonSelection(pokemon: Pokemon)
}

class PokemonSelectionViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var delegate: DataEnteredDelegate? = nil
    var inSearchMode = false
    var unfilterPokemon = [Pokemon]()
    var filterPokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        
        // Create New Pokemon List For Easier Sorting
        for index in 0..<pokemonList.count {
            let poke = Pokemon(name: pokemonList[index], pokeID: index + 1)
            unfilterPokemon.append(poke)
        }
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
        if inSearchMode {
            delegate?.userDidEnterPokemonSelection(pokemon: filterPokemon[indexPath.row])
        } else {
            delegate?.userDidEnterPokemonSelection(pokemon: unfilterPokemon[indexPath.row])
        }
        dismiss(animated: true, completion: nil)
    }
}

// MARK: UICollectionViewDataSource

extension PokemonSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inSearchMode ? filterPokemon.count : unfilterPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell {
            if inSearchMode {
                cell.configureCell(pokemon: filterPokemon[indexPath.row])
            } else {
                cell.configureCell(pokemon: unfilterPokemon[indexPath.row])
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: UISearchBarDelegate

extension PokemonSelectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collectionView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filterPokemon = unfilterPokemon.filter({$0.name.range(of: lower) != nil})
            for pokemon in filterPokemon {
                print(pokemon.name)
            }
            collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
