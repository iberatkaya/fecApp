import UIKit
import SnapKit
import Charts

class CandidateDonationsByStateCellView: UITableViewCell {
    var donations: [CandidateDontaionsByState]? {
        didSet {
            loadView()
        }
    }
    
    func loadView() {
        addSubview(year)
        addSubview(pieChart)
        
        year.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
        }
        
        pieChart.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalTo(year.snp.leading)
        }
        
        if let yearInt = donations?.first?.cycle {
            year.text = "\(yearInt)"
        }
        
        setChartData()
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
        var remainingEntries: [CandidateDontaionsByState] = []
        let amountDisplayed = 5
        if let donations {
            for i in 0..<amountDisplayed {
                if i < donations.count {
                    let entry = PieChartDataEntry()
                    entry.y = (donations[i].total ?? 0)
                    entry.label = donations[i].state
                    entries.append(entry)
                }
            }

            if donations.count > (amountDisplayed - 1)
            {
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
            set.valueFont = .boldSystemFont(ofSize: 14)
            set.valueFormatter = CustomPieValueFormatter()
            set.colors = [.orange, .green, .systemPink, .brown, .cyan, .magenta, .purple, .yellow]
            set.yValuePosition = .outsideSlice
            pieChart.data = PieChartData(dataSet: set)
            print(set)
            pieChart.notifyDataSetChanged()
        }
    }
}
