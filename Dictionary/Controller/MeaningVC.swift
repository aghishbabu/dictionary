//
//  MeaningVC.swift
//  Dictionary
//
//  Created by Aghish Babu on 13/09/22.
//

import UIKit

class MeaningVC: UIViewController {
    
    let data = DataViewModel()
    var word = [Root]()
    var mean = [Meaning]()
    var searchText = String()
    var mainDefinition = [Definition]()
    
    var def = String()
    var phTic = String()
    
    
    
    @IBOutlet weak var wordlbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    
    @IBOutlet weak var originDescLbl: UILabel!
    
    @IBOutlet weak var meaningLbl: UILabel!
    @IBOutlet weak var phoneticLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        DispatchQueue.main.async { [self] in
            data.fetchWordMeaning(word: searchText ) { data in
                self.word = data
                print(self.word)
                let dataArray = self.word[0]
                let meaning = dataArray.meanings[0]
                let mainDefinition = meaning.definitions
                let mainPhonetic = dataArray.phonetics[0]
                def =  mainDefinition[0].definition
                phTic = mainPhonetic.text ?? ""
                DispatchQueue.main.async {
                    self.meaningLbl.text = def
                    self.phoneticLbl.text = phTic
                    self.wordlbl.text = searchText.capitalized
                }
                
            }
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
}
