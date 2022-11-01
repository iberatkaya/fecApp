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
        if let id = candidate.candidateID {
            let controller = CandidateDetailsViewController(candidateID: id)
            navigationController?.pushViewController(controller, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Candidates"
        
        searchbar.delegate = self
        
        view.addSubview(searchbar)
        view.addSubview(tableView)
        view.addSubview(loadingView)
        
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
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(-8)
        }
        
        loadingView.snp.makeConstraints { make in
            make.top.equalTo(searchbar.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
        }
        
        Task {
            await viewModel.searchForCandidate("Bernie")
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.loadingView.stopAnimating()
            }
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
        bar.placeholder = "Search for candidate..."
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let loadingView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        loadingView.startAnimating()
        if let text = searchBar.text {
            viewModel.resetData()
            self.tableView.reloadData()
            Task {
                await viewModel.searchForCandidate(text)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingView.stopAnimating()
                }
            }
        }
    }
}

