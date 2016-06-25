//
//  ViewController.swift
//  AllFlags
//
//  Created by mac os on 17.06.16.
//  Copyright © 2016 Khrystenko Dmytro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var flag = [Flag]()
    var filteredFlag = [Flag]()
    var inSearchMode = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        parseFlagsCSV()
        
    }
    
    
    
    
    
    func parseFlagsCSV() {
        
        let path = NSBundle.mainBundle().pathForResource("flag", ofType: "csv")!
               
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows  {
                let currentFlagId = Int(row["id"]!)!
                let name = row["identifier"]!
                let aboutTxt = row["about"]!
                let currentFlag = Flag(name: name, flagsId: currentFlagId, aboutTxt: aboutTxt)
                flag.append(currentFlag)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FlagCell", forIndexPath: indexPath) as? FlagCell {
            
            let currentFlag: Flag!
            
            if inSearchMode {
                currentFlag = filteredFlag[indexPath.row]
                
            } else {
                currentFlag = flag[indexPath.row]
            }
            
            cell.configureCell(currentFlag)
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    

    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var currentFlag: Flag!
        
        if inSearchMode {
            currentFlag = filteredFlag[indexPath.row]
        } else {
            currentFlag = flag[indexPath.row]
        }
        
        performSegueWithIdentifier("FlagDetailViewController", sender: currentFlag)
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredFlag.count
        }
        
        return flag.count
    }
    
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 129, height: 105)
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        view.endEditing(true)
    }
    
    
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredFlag = flag.filter({$0.name.rangeOfString(lower) != nil})
            
            collection.reloadData()
        }
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "FlagDetailViewController" {
            if let detailVC = segue.destinationViewController as? FlagDetailViewController {
                if let currentFlag = sender as? Flag {
                    detailVC.flag = currentFlag
                }
            }
        }
        
    }

}

