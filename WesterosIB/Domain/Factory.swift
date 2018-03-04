//
//  Factory.swift
//  WesterosIB
//
//  Created by Irma Blanco on 04/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//


import UIKit

/*
 -- Creamos una clase Repository que tiene una propiedad estatica que se llama local
 -- local es de tipo LocalFactory, que es otra clase implementada debajo
 -- La clase LocalFactory se conforma al protocolo HouseFactory
 -- El protocolo HouseFactory aporta una propiedad de tipo array de casas
 -- Si quiero obtener las casas en mi appdelegate tengo que usear repository
 */

//var inputFormatter: DateFormatter!

protocol  DataFactory {
    var seasons: [Season] { get }
    func seasonFilter(filterBy:(Season) -> Bool) -> [Season]
    var houses: [House] { get }
    func house(name: String) -> House?
    func houseFilter(filterBy:(House) -> Bool) -> [House]
    func house(named: HouseName) -> House?
    
}

enum HouseName {
    case Stark, Lannister, Targaryen
    
    func toString() -> String {
        switch self {
        case  .Stark:
            return "Stark"
        case  .Lannister:
            return "Lannister"
        case  .Targaryen:
            return "Targaryen"
            
        }
    }
}


final class LocalFactory: DataFactory{

    
    
    var houses: [House] {
        
        //Houses creation here
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Leon Rampante")
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Dragón Tricéfalo")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil , words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre",url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        let viserys = Person(name: "Viserys", alias: "El rey mendigo", house:targaryenHouse)
        
        
        //Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        
        
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        lannisterHouse.add(person: jaime)
        
        targaryenHouse.add(person: dani)
        targaryenHouse.add(person: viserys)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
        
    }
    
    
    var seasons: [Season] {
        // Season creation
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd-MM-yyyy"
        let firstSeason =  Season(seasonName: "Game of Thrones (season 1)", airDate: inputFormatter.date(from: "17-04-2011")!)
        let secondSeason =  Season(seasonName: "Game of Thrones (season 2)", airDate: inputFormatter.date(from: "01-04-2012")!)
        let thirdSeason =  Season(seasonName: "Game of Thrones (season 3)", airDate: inputFormatter.date(from: "31-03-2013")!)
        let fourthSeason =  Season(seasonName: "Game of Thrones (season 4)", airDate: inputFormatter.date(from: "06-04-2014")!)
        let fifthSeason =  Season(seasonName: "Game of Thrones (season 5)", airDate: inputFormatter.date(from: "12-04-2015")!)
        let sixthSeason =  Season(seasonName: "Game of Thrones (season 6)", airDate: inputFormatter.date(from: "24-04-2016")!)
        let seventhSeason =  Season(seasonName: "Game of Thrones (season 7)", airDate: inputFormatter.date(from: "16-07-2017")!)
        
        // Episode creation
        let episode1x01 = Episode(title: "Winter is Comming", releaseDate:  inputFormatter.date(from: "17-04-2011")!, season: firstSeason)
        let episode1x02 = Episode(title: "The Kingsroad", releaseDate:  inputFormatter.date(from: "24-04-2011")!, season: firstSeason)
        let episode2x01 = Episode(title: "The North Remembers", releaseDate:  inputFormatter.date(from: "01-04-2012")!, season: thirdSeason )
        let episode2x02 = Episode(title: "The Night Lands", releaseDate:  inputFormatter.date(from: "08-04-2012")!, season: secondSeason)
        let episode3x01 = Episode(title: "Valar Dohaeris", releaseDate:  inputFormatter.date(from: "31-03-2013")!, season: thirdSeason)
        let episode3x02 = Episode(title: "Dark Wings, Dark Words", releaseDate:  inputFormatter.date(from: "07-04-2013")!,season: thirdSeason)
        let episode4x01 = Episode(title: "Two Swords", releaseDate:  inputFormatter.date(from: "06-04-2014")!, season: fourthSeason)
        let episode4x02 = Episode(title: "The Lion and the Rose", releaseDate:  inputFormatter.date(from: "12-04-2014")!, season: fourthSeason)
        let episode5x01 = Episode(title: "The Wars to Come", releaseDate:  inputFormatter.date(from: "12-04-2015")!, season: fifthSeason)
        let episode5x02 = Episode(title: "The House of Black and White", releaseDate:  inputFormatter.date(from: "19-04-2015")!, season: fifthSeason)
        let episode6x01 = Episode(title: "The Red Woman", releaseDate:  inputFormatter.date(from: "24-04-2016")!, season: sixthSeason)
        let episode6x02 = Episode(title: "Home", releaseDate:  inputFormatter.date(from: "01-05-2016")!, season: sixthSeason)
        let episode7x01 = Episode(title: "Dragonstone", releaseDate:  inputFormatter.date(from: "16-07-2017")!, season: sixthSeason)
        let episode7x02 = Episode(title: "Stormborn", releaseDate:  inputFormatter.date(from: "23-07-2017")!, season: sixthSeason)
        
        // Add episodes to seasons
        firstSeason.add(episodes: episode1x01, episode1x02 )
        secondSeason.add(episodes: episode2x01, episode2x02  )
        thirdSeason.add(episodes: episode3x01 , episode3x02 )
        fourthSeason.add(episodes: episode4x01, episode4x02 )
        fifthSeason.add(episodes: episode5x01, episode5x02)
        sixthSeason.add(episodes: episode6x01, episode6x02)
        seventhSeason.add(episodes: episode7x01, episode7x02)
        
        return [firstSeason, secondSeason, thirdSeason, fourthSeason, fifthSeason, sixthSeason, seventhSeason].sorted()
    }
    
    
    func seasonFilter(filterBy: (Season) -> Bool) -> [Season] {
        return seasons.filter(filterBy)
    }
    
    func house(name: String) -> House? {
        return houses.filter{ $0.name.uppercased() == name.uppercased() }.first
    }
    
    func houseFilter(filterBy: (House) -> Bool) -> [House] {
        return houses.filter(filterBy)
    }
    
    func house(named: HouseName) -> House? {
        return houses.filter{$0.name == named.toString()  }.first
    }
    
    
    
}






