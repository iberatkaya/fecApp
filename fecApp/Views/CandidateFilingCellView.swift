import UIKit
import SnapKit
import Charts

class CandidateFilingCellView: UICollectionViewCell {
    var filing: CandidateFiling? {
        didSet {
            setContent()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent() {
        if let desc = filing?.documentDescription {
            documentDescription.text = desc
        }
    }
    
    func loadView() {
        addSubview(clickText)
        addSubview(documentDescription)
        
        documentDescription.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        clickText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(documentDescription.snp.bottom).inset(-8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        layer.borderWidth = 1
        layer.cornerRadius = 12
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    let documentDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let clickText: UILabel = {
        let label = UILabel()
        label.text = "Click to view filing!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
