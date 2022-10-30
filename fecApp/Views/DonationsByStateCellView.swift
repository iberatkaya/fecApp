import UIKit
import SnapKit
import Charts

class DonationsByStateCellView: UITableViewCell {
    var donation: CandidateDonationsByState? {
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
        state.text = donation?.stateFull
        
        if let total = donation?.total {
            amount.text = String(total).currencyFormatting()
        }
    }
    
    func loadView() {
        addSubview(state)
        addSubview(amount)
        
        state.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
        }
        amount.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
            make.top.equalTo(state.snp.bottom)
        }
    }
    
    let state: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amount: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
