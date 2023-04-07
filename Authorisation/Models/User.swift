//
//  MainDataModel.swift
//  Authorisation
//
//  Created by Andrey Matviets on 05.04.2023.
//

import Foundation

struct User {
    let nickName: String
    let passWord: String
    let person: Person
    
    static func getUser() -> User {
        let matvietsAS = User(
            nickName: "admin",
            passWord: "123",
            person: Person.getPerson()
        )
        return matvietsAS
    }
}

struct Person {
    let name: String
    let surname: String
    let age: String
    let occupation: String
    let location: String
    let photo: String
    let biography: String
    let hobby: String
    
    var fullName: String {
        name + " " + surname
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Andrey",
            surname: "Matviets",
            age: "36",
            occupation: "Director of business development",
            location: "United Arab Emirates, Dubai",
            photo: "AboutMe",
            biography: "was born in the Kazakh Soviet Socialist Republic (now Kazakhstan) into a family of Ukranian deportees who were exiled there in 1946. Was studying in Yaroslavl",
            hobby: "🏂"
        )
    }
}
