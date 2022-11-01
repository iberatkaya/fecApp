import UIKit
import SnapKit
import Charts

class CandidateDonationsByStateCellView: UITableViewCell {
    var donations: [CandidateDonationsByState]? {
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
        if let yearInt = donations?.first?.cycle {
            year.text = "\(yearInt)"
        }
        
        setChartData()
    }
    
    func loadView() {
        addSubview(year)
        addSubview(pieChart)
        
        year.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(8)
        }
        
        pieChart.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalTo(year.snp.leading)
        }
    }
    
    let year: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pieChart: PieChartView = {
        let chart = PieChartView()
        chart.drawEntryLabelsEnabled = false
        chart.highlightPerTapEnabled = false
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()

    func setChartData() {
        var entries = [PieChartDataEntry]()
        var remainingEntries: [CandidateDonationsByState] = []
        let amountDisplayed = 4
        if let donations {
            for i in 0..<amountDisplayed {
                if i < donations.count {
                    let entry = PieChartDataEntry()
                    entry.y = (donations[i].total ?? 0)
                    entry.label = donations[i].state
                    entries.append(entry)
                }
            }

            if donations.count > (amountDisplayed - 1) {
                for i in amountDisplayed..<donations.count {
                    if i < donations.count {
                        remainingEntries.append(donations[i])
                    }
                }
                
                let entry = PieChartDataEntry()
                entry.y = remainingEntries.reduce(0, { x, y in
                    return x + (y.total ?? 0)
                })
                entry.label = "Remaining"
                entries.append(entry)
            }
            
            
            let set = PieChartDataSet(entries: entries)
            set.label = ""
            set.valueTextColor = .black
            set.valueFont = .boldSystemFont(ofSize: 13)
            set.valueFormatter = CustomPieValueFormatter()
            set.colors = [.orange, .green, .systemPink, .brown, .cyan, .magenta, .purple, .yellow]
            set.yValuePosition = .outsideSlice
            pieChart.data = PieChartData(dataSet: set)
            print(set)
            pieChart.notifyDataSetChanged()
        }
    }
}
