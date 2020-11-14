//
//  CountriesDBModel.swift
//  SPS
//
//  Created by Mohammed hassan on 11/14/20.
//  Copyright © 2020 Mohammed hassan. All rights reserved.
//
import RealmSwift

class CountriesDBModel: Object {
    @objc dynamic var countryFlag: String?
    @objc dynamic var countryName: String?
    @objc dynamic var countryCapitalCity: String?
    @objc dynamic var countryCurrency: String?
}
