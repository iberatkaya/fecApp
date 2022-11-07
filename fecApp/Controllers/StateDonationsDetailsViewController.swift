//
//  DonationsDetailsViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/30/22.
//


import UIKit
import SnapKit

class StateDonationsDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StateDonationsDetailsTableHeaderDelegate {
    
    let donations: [CandidateDonationsByState]
    
    init(candidate: CandidateDetails, donations: [CandidateDonationsByState]) {
        self.donations = donations
        self.viewModel = DonationsByStateViewModel(candidate: candidate, donationsByState: donations)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let viewModel: DonationsByStateViewModel
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 72
        
        
        tableView.register(DonationsByStateCellView.self, forCellReuseIdentifier: "DonationsByStateCellView")
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(-8)
            make.leading.trailing.equalToSuperview()
        }
        
        self.tableView.reloadData()
        
        Task {
            await viewModel.fetchCandidateFilings()
            
            self.tableView.reloadData()
        }
    }
        
    let tableViewHeaderHeight = 280.0
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = StateDonationsDetailsTableHeader(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: tableViewHeaderHeight), candidate: viewModel.candidate, donations: viewModel.donationsByState)
        header.delegate = self
        header.filings = viewModel.filings
        return header
    }
    
    func pressedCell(url: String) {
        self.navigationController?.pushViewController(WebViewController(url: url), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.donationsByState.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DonationsByStateCellView", for: indexPath) as! DonationsByStateCellView
        cell.donation = viewModel.donationsByState[indexPath.row]
        cell.selectionStyle = .none
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = .zero
        cell.layoutMargins = .zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
}
