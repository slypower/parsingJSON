//
//  Images.swift
//  parsingJSON
//
//  Created by Виталий Бобрик on 10.04.22.
//

enum Link: String {
    case catURL = "https://api.thecatapi.com/v1/images/search?format=json"
    case dogURL = "https://dog.ceo/api/breeds/image/random"
}

enum Animal: String, CaseIterable {
    case cat = "Cat"
    case dog = "Dogs"
}

struct Cats: Decodable {
    let id: String?
    let url: String
    let width: Int
    let height: Int
    let breeds: [String]?
}

struct Dogs: Decodable {
    let message: String?
    let status: String?
}
