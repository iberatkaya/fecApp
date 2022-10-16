//
//  ViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/15/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Candidates"
        
        searchbar.delegate = self
        
        view.addSubview(searchbar)
        
        searchbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
        
        apiService.getCandidates()
    }
    
    let apiService = FECApi()
    
    let searchbar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

