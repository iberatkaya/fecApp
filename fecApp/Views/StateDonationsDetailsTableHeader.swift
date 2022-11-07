//
//  StateDonationsTableHeader.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/30/22.
//

import UIKit
import SnapKit

class StateDonationsDetailsTableHeader: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filings?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CandidateFilingCellView", for: indexPath) as! CandidateFilingCellView
        cell.filing = filings?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let filings = filings?[indexPath.row], let url = filings.htmlURL {
            delegate?.pressedCell(url: url)
        }
    }
    
    let candidate: CandidateDetails
    let donations: [CandidateDonationsByState]
    var filings: [CandidateFiling]?
    weak var delegate: StateDonationsDetailsTableHeaderDelegate?
    
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
        addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CandidateFilingCellView.self, forCellWithReuseIdentifier: "CandidateFilingCellView")
        
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(totalDonations.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.alwaysBounceHorizontal = true
        collection.isPagingEnabled = true
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
}

protocol StateDonationsDetailsTableHeaderDelegate: AnyObject {
    func pressedCell(url: String)
}
