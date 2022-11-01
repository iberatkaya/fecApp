//
//  CandidateDetailsViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/17/22.
//


import UIKit
import SnapKit

class CandidateDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let candidateID: String
    
    init(candidateID: String) {
        self.candidateID = candidateID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        view.addSubview(loadingView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 260
        
        tableView.register(CandidateDonationsByStateCellView.self, forCellReuseIdentifier: "CandidateDonationsByStateCellView")
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(-8)
            make.leading.trailing.equalToSuperview()
        }
        
        loadingView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
        }
        
        Task {
            await viewModel.getCandidate(candidateID)
            self.loadingView.stopAnimating()
            self.tableView.reloadData()
            if let donationsByState = viewModel.donationsByState, donationsByState.isEmpty {
                tableView.alwaysBounceVertical = false
                self.tableView.setEmptyMessage("No data found")
            } else if viewModel.donationsByState == nil {
                tableView.alwaysBounceVertical = false
                self.tableView.setEmptyMessage("No data found")
            } else {
                tableView.alwaysBounceVertical = true
            }
        }
    }
        
    let tableViewHeaderHeight = 200.0
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let candidate = viewModel.candidate {
            let header = CandidateDetailsTableHeader(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: tableViewHeaderHeight), candidate: candidate)
            return header
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getValidDonationYears().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CandidateDonationsByStateCellView", for: indexPath) as! CandidateDonationsByStateCellView
        let cycle = viewModel.getValidDonationYears()[indexPath.row]
        cell.donations = viewModel.getCandidateDonationsByYear(year: cycle)
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let candidate = viewModel.candidate {
            let year = viewModel.getValidDonationYears()[indexPath.row]
            let donations = viewModel.getCandidateDonationsByYear(year: year)
            self.navigationController?.pushViewController(StateDonationsDetailsViewController(candidate: candidate, donations: donations), animated: true)
        }
    }
    
    let viewModel = CandidateDetailsViewModel()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let loadingView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
}
