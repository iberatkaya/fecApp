//
//  CandidateDetailsViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/17/22.
//


import UIKit
import SnapKit

class CandidateDetailsViewController: UIViewController {
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
        
        view.addSubview(loadingView)
        view.addSubview(candidateName)
        view.addSubview(address)
        view.addSubview(party)
        view.addSubview(office)
        view.addSubview(electionYears)
        
        candidateName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        party.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(candidateName.snp.bottom).inset(-16)
        }
        
        address.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalTo(party.snp.bottom).inset(-8)
        }
        
        office.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(address.snp.bottom).inset(-8)
        }
        
        electionYears.snp.makeConstraints { make in
            make.top.equalTo(office.snp.bottom).inset(-8)
            make.leading.equalToSuperview().inset(12)
        }
        
        loadingView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.centerX.equalToSuperview()
        }
        
        Task {
            await viewModal.getCandidate(candidateID)
            loadingView.stopAnimating()
            if let candidateDetails = viewModal.candidate {
                candidateName.text = candidateDetails.name
                var addressText = "Address: " + (candidateDetails.addressStreet1 ?? "")
                if let addressStreet2 = candidateDetails.addressStreet2 {
                    addressText += " " + addressStreet2
                }
                if let city = candidateDetails.addressCity, let state = candidateDetails.addressZip {
                    addressText += " \(city) \(state)"
                }
                address.text = addressText
                
                party.text = "Party: \(candidateDetails.partyFull ?? "")"
                office.text = "Office: \(candidateDetails.officeFull ?? "")"
                if let electionYearsArr = candidateDetails.electionYears {
                    electionYears.text = "Election Years: " + electionYearsArr.map({ "\($0)" }).joined(separator: ", ")
                }
            }
        }
    }
    
    let viewModal = CandidateDetailsViewModel()
    
    let candidateName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let address: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let party: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let office: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loadingView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
    
    let electionYears: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let comitees: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
