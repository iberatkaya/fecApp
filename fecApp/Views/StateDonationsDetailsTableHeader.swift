//
//  StateDonationsTableHeader.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/30/22.
//

import UIKit
import SnapKit

class StateDonationsDetailsTableHeader: UIView {
    let candidate: CandidateDetails
    let donations: [CandidateDonationsByState]
    
    required init(frame: CGRect, candidate: CandidateDetails, donations: [CandidateDonationsByState]) {
        self.candidate = candidate
        self.donations = donations
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        
        addSubview(candidateName)
        addSubview(electionYear)
        addSubview(totalDonations)
        
        candidateName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        electionYear.snp.makeConstraints { make in
            make.top.equalTo(candidateName.snp.bottom).inset(-16)
            make.leading.equalToSuperview().inset(12)
        }
        
        totalDonations.snp.makeConstraints { make in
            make.top.equalTo(electionYear.snp.bottom).inset(-16)
            make.leading.equalToSuperview().inset(12)
        }
        
        candidateName.text = candidate.name
        
        if let electionYearInt = donations.first?.cycle {
            electionYear.text = "Election Year: \(electionYearInt)"
        }
        totalDonations.text = "Total donations: " + String(donations.reduce(0, { $0 + ($1.total ?? 0) })).currencyFormatting(hideCents: true)
    }
    
    let candidateName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let electionYear: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalDonations: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
