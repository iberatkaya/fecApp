//
//  CandidateDetailsViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/17/22.
//


import UIKit
import SnapKit

class CandidateDetailsViewController: UIViewController {
    
    let candidate: Candidate
    
    init(candidate: Candidate) {
        self.candidate = candidate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(candidateName)
        view.addSubview(state)
        view.addSubview(party)
        view.addSubview(office)
        
        candidateName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        party.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(candidateName.snp.bottom).inset(-8)
        }
        
        state.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(party.snp.bottom).inset(-8)
        }
        
        office.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(state.snp.bottom).inset(-8)
        }
        
        candidateName.text = candidate.name
        if let stateStr = candidate.state {
            state.text = "State: \(stateDictionary[stateStr] ?? stateStr)"
        }
        party.text = "Party: \(candidate.party ?? "")"
        office.text = "Office: \(candidate.officeFull ?? "")"
        
    }
    
    let candidateName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let state: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
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
}
