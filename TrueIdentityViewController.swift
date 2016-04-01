//
//  TrueIdentityViewController.swift
//  SimpleHeroTable
//
//  Created by sojiwritescode on 3/30/16.
//  Copyright © 2016 sojiwritescode. All rights reserved.
//

import Foundation

enum RealIDs: Int {
    
    case Tony, Steve, Natasha, Bruce, Thor, Clint, Nick
    
    static let count: Int = {
        var max = 0
        while let i = RealIDs(rawValue: max) {
            max = max + 1
        }
        return max
    }()
    
    var realName: String {
        let realNames = [
            "Tony Stark",
            "Steve Rogers",
            "Natasha Romanoff",
            "Bruce Banner",
            "Thor Odinson",
            "Clint Barton",
            "Nick Fury"
        ]
        return realNames[rawValue]
    }
    
    var realPicName: String {
        let imageNames = [
            "tony.png",
            "steve.png",
            "natasha.png",
            "bruce.png",
            "thor.png",
            "clint.png",
            "nick.png"
        ]
        return imageNames[rawValue]
    }
    
}

import UIKit

class TrueIdentityViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var heroIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showHero" {
            let heroRevealVC = segue.destinationViewController as! HeroViewController
            heroRevealVC.heroIndex = self.heroIndex
        }
    }
    
}

extension TrueIdentityViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RealIDs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let hero = RealIDs(rawValue: indexPath.row)!
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TrueIdentityTableViewCell
        
        cell.realName = hero.realName
        cell.realPicName = hero.realPicName
        
        return cell
    }
}

extension TrueIdentityViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.heroIndex = indexPath.row
        
        self.performSegueWithIdentifier("showHero", sender: self)
    }
    
}
