import UIKit
import SnapKit

class CandidateSearchCellView: UITableViewCell {
    var candidate: Candidate? {
        didSet {
            loadView()
        }
    }
    
    func loadView() {
        addSubview(candidateName)
        addSubview(state)
        addSubview(party)
        addSubview(office)
        
        candidateName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        party.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview()
        }
        
        state.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(8)
        }
        
        office.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(12)
        }
        
        candidateName.text = candidate?.name
        if let stateStr = candidate?.state {
            state.text = stateDictionary[stateStr] ?? stateStr
        }
        party.text = candidate?.party
        office.text = candidate?.officeFull
    }
    
    let candidateName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let state: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let party: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let office: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
