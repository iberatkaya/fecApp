//
//  ViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/15/22.
//

import UIKit
import SnapKit

class SearchCandidateViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.candidates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CandidateSearchCellView", for: indexPath) as! CandidateSearchCellView
        cell.candidate = viewModel.candidates[indexPath.row]
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let candidate = viewModel.candidates[indexPath.row]
        let controller = CandidateDetailsViewController(candidate: candidate)
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Candidates"
        
        searchbar.delegate = self
        
        view.addSubview(searchbar)
        view.addSubview(tableView)
        
        tableView.register(CandidateSearchCellView.self, forCellReuseIdentifier: "CandidateSearchCellView")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        searchbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchbar.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let viewModel = CandidatesSearchViewModel()
    
    let searchbar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            Task {
                await viewModel.searchForCandidate(text)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

