//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Kadir Aydınlı on 20.12.2022.
//

import Foundation
import UIKit

class PlaceModel {
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLangitude = ""
    
    private init() {
        
    }
}
