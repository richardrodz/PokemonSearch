//
//  Pokemon.swift
//  PokeSearch
//
//  Created by Richard Rodriguez on 5/12/17.
//  Copyright © 2017 Richard Rodriguez. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String
    fileprivate var _pokeID: Int
    
    var name: String {
        return _name
    }
    
    var pokeID: Int {
        return _pokeID
    }
    
    init(name: String, pokeID: Int) {
        self._name = name
        self._pokeID = pokeID
    }
}
