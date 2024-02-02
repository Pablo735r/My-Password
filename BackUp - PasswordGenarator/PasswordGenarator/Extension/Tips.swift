//
//  Tips.swift
//  MyToDo
//
//  Created by Pablo Amador on 20/3/23.
//

import Foundation

struct Tips: Identifiable, Decodable {
        var id: Int
        var title: String
        var tip: String
       
}

let sampleTips = Tips(id: 1, title: "Think Before You Click", tip: "Links in mails in the form of password recovery emails, bank statements, etc. Are among the most popular methods used by hackers to trick you and gain your personal information. The fake sites connected to these links are too similar to the real ones where the hackers will get you to provide your personal details and gain access to your account using the same")



var tips: [Tips] = load("JSONTips.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

