import UIKit
import SnapKit

class CandidateSearchCellView: UITableViewCell {
    var candidate: Candidate? {
        didSet {
            setContent()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent() {
        candidateName.text = candidate?.name
        if let stateStr = candidate?.state {
            state.text = stateDictionary[stateStr] ?? stateStr
        }
        party.text = candidate?.party
        office.text = candidate?.officeFull
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
            make.top.equalTo(candidateName.snp.bottom).inset(-12)
        }
        
        state.snp.makeConstraints { make in
            make.top.equalTo(party.snp.bottom).inset(-8)
            make.leading.equalToSuperview().inset(12)
        }
        
        office.snp.makeConstraints { make in
            make.top.equalTo(candidateName.snp.bottom).inset(-12)
            make.trailing.equalToSuperview().inset(12)
        }
        
    }
    
    let candidateName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 1
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
