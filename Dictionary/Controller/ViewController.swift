//
//  ViewController.swift
//  Dictionary
//
//  Created by Aghish Babu on 13/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var enterText: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    
    let data = DataViewModel()
    var word = [Root]()
    
    override func viewDidLoad() {
        
        title = "Dictionary"
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onClickSearch(_ sender: Any) {
        if enterText.text != "" {
            
            performSegue(withIdentifier: "detailSegue", sender: self)
        } else {
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue"{
            
            guard let detailVC = segue.destination as? MeaningVC else { return }
            detailVC.searchText = enterText.text ?? ""
            
        }
        
        
        
        
    }
    
    
}

