//
//  ViewModel.swift
//  CatsFactsSacdeli
//
//  Created by Tamuna Kakhidze on 01.05.24.
//

import Foundation
import NetworkServicePackage

protocol ViewModelDelegate: AnyObject {
    func catfactsFetched(_ facts: [Facts])
}

class ViewModel {
    
    var catFactsArray = [Facts]()
    var catsUrl = "https://catfact.ninja/facts?max_length=100&limit=28"
    weak var delegate: ViewModelDelegate?
    
    func viewdidload() {
        fetchData() { [weak self] result in
            switch result {
            case .success(let success):
                self?.catFactsArray = success.data
                self?.delegate?.catfactsFetched(self!.catFactsArray)
                //print(self!.catFactsArray)
            case .failure(let failure):
                print("fetching failed. \(failure.localizedDescription)")
            }
            
        }
    }
    func fetchData(completion: @escaping (Result<FactsInfo,Error>) ->(Void)){
        NetworkService().getData(urlString: catsUrl, completion: completion)
    }
    
}



