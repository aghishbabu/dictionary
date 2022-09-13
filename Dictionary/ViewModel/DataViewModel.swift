//
//  DataViewModel.swift
//  Dictionary
//
//  Created by Aghish Babu on 13/09/22.
//

import Foundation


struct DataViewModel {
    
    func fetchWordMeaning(word: String, comp : @escaping ([Root])->()) {
        
        let api = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)" )!
        
        
        URLSession.shared.dataTask(with: api) { data, reponse, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
           
            if let httpResponse = reponse as? HTTPURLResponse {
                print("error \(httpResponse.statusCode)")
                
                if httpResponse.statusCode != 404 {
                    if let data = data {
                        
                        let jsonDecoder = JSONDecoder()
                        
                        let wordData = try! jsonDecoder.decode([Root].self, from: data)
                        
                        comp(wordData)
                    }
                }
            
            
        }
        }.resume()
        
        
    }
}
