//
//  CandidateDetailsViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/17/22.
//


import UIKit
import SnapKit

class CandidateDetailsTableHeader: UIView {
    let candidate: CandidateDetails
    
    required init(frame: CGRect, candidate: CandidateDetails) {
        self.candidate = candidate
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        
        addSubview(candidateName)
        addSubview(address)
        addSubview(party)
        addSubview(office)
        addSubview(electionYears)
        
        candidateName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
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
        
        candidateName.text = candidate.name
        var addressText = "Address: " + (candidate.addressStreet1 ?? "")
        if let addressStreet2 = candidate.addressStreet2 {
            addressText += " " + addressStreet2
        }
        if let city = candidate.addressCity, let state = candidate.addressZip {
            addressText += " \(city) \(state)"
        }
        address.text = addressText
        
        party.text = "Party: \(candidate.partyFull ?? "")"
        office.text = "Office: \(candidate.officeFull ?? "")"
        if let electionYearsArr = candidate.electionYears {
            electionYears.text = "Election Years: " + electionYearsArr.map({ "\($0)" }).joined(separator: ", ")
        }
    }
    
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
