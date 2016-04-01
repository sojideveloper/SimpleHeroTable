//
//  HeroViewController.swift
//  SimpleHeroTable
//
//  Created by sojiwritescode on 3/30/16.
//  Copyright © 2016 sojiwritescode. All rights reserved.
//

import UIKit

enum Superheroes: Int {
    
    case IronMan,
        CaptainAmerica,
        BlackWidow,
        Hulk,
        Thor,
        Hawkeye,
        NickFury
    
    static let count: Int = {
        var max = 0
        while let i = Superheroes(rawValue: max) {
            max = max + 1
        }
        return max
    }()
    
    var heroName: String {
        let heroNames = [
            "Iron Man",
            "Captain America",
            "Black Widow",
            "Hulk",
            "Thor",
            "Hawkeye",
            "Nick Fury"
        ]
        return heroNames[rawValue]
    }
    
    var heroImageName: String {
        let heroImageNames = [
            "IronMan",
            "CaptainAmerica",
            "BlackWidow",
            "Hulk",
            "Thor",
            "Hawkeye",
            "NickFury"
        ]
        return heroImageNames[rawValue]
    }
    
}

class HeroViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    var heroIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let superhero = Superheroes(rawValue: heroIndex)!
        
        
        
        heroImage.image = UIImage(named: superhero.heroImageName)
        heroNameLabel.text = superhero.heroName
    }
    
    override func viewWillAppear(animated: Bool) {
        
        print("The HERO index is: \(heroIndex)")
        
    }
    
}

