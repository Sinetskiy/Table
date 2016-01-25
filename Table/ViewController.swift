//
//  ViewController.swift
//  Table
//
//  Created by Boss on 25.01.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items:[String] = [String]()
    
    override func viewDidLoad(){
        
        super.viewDidLoad();
        setupData()
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
    }
    
    func setupData(){
        //семейство шрифтов
        let familyNames = UIFont.familyNames()
        
        for aFamilyName in familyNames{
            
            let allFontsOfThisFamily:[String] = UIFont.fontNamesForFamilyName(aFamilyName)
            
            items += allFontsOfThisFamily;
            
        }
        
    }
}

//Поддерживаем протокол UIViewDelegate
extension ViewController: UITableViewDelegate{
    
    
}

//поддерживаем протокол UITableViewDataSource
extension ViewController: UITableViewDataSource{
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
             return items.count;
         }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath:  indexPath)
            
            let fontName = items[indexPath.row]
            let font = UIFont(name: fontName, size: 14)
            
            cell.textLabel?.text = items[indexPath.row]
            cell.textLabel?.font = font
           
            return cell;
        }

}


    




