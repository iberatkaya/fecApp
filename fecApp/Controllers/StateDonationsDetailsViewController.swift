//
//  DonationsDetailsViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/30/22.
//


import UIKit
import SnapKit

class StateDonationsDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        
        view.addSubview(loadingView)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 72
        
        tableView.register(DonationsByStateCellView.self, forCellReuseIdentifier: "DonationsByStateCellView")
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(-8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        loadingView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.centerX.equalToSuperview()
        }
        
        self.tableView.reloadData()
    }
        
    let tableViewHeaderHeight = 80.0
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = StateDonationsDetailsTableHeader(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: tableViewHeaderHeight), candidate: viewModel.candidate, donations: viewModel.donationsByState)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.donationsByState.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DonationsByStateCellView", for: indexPath) as! DonationsByStateCellView
        cell.donation = viewModel.donationsByState[indexPath.row]
        cell.selectionStyle = .none
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
    
    let loadingView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
}