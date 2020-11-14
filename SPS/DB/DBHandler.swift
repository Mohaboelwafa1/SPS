//
//  DBHandler.swift
//  SPS
//
//  Created by Mohammed hassan on 11/14/20.
//  Copyright © 2020 Mohammed hassan. All rights reserved.
//
import RealmSwift

class DBHandler {
    func saveToDB(data: [CountriesResponseModel]) {
        let realm = try! Realm()

        try! realm.write {
            realm.deleteAll()
        }

        for country in data {
            let countryModel = CountriesDBModel()
            countryModel.countryFlag = country.flag
            countryModel.countryName = country.name
            countryModel.countryCapitalCity = country.capital
            countryModel.countryCurrency = country.currencies.first?.name

            try! realm.write {
                realm.add(countryModel)
            }
        }
    }
}
