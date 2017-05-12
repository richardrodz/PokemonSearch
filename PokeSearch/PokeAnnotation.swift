//
//  PokeAnnotation.swift
//  PokeSearch
//
//  Created by Richard Rodriguez on 5/12/17.
//  Copyright © 2017 Richard Rodriguez. All rights reserved.
//

import Foundation
import MapKit

class PokeAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var pokemonNumber: Int
    var pokemonName: String
    
    init(coordinate: CLLocationCoordinate2D, pokemonNumber: Int, pokemonName: String) {
        self.coordinate = coordinate
        self.pokemonNumber = pokemonNumber
        self.pokemonName = pokemonName
        self.title = self.pokemonName
    }
    
}
