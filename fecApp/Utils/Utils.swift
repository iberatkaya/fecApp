import Foundation
import Charts

func getAPIKey() -> String? {
    guard let infoDictionary = Bundle.main.infoDictionary else {
        return nil
    }
    guard let apiKey = infoDictionary["APIKey"] as? String else {
        return nil
    }
    return apiKey
}

func formatDate(_ date: String) -> String? {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = inputDateFormatter.date(from: date)
    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = "dd/MM/yyyy"
    if let date {
        return outputDateFormatter.string(from: date)
    }
    return nil
}

public class CustomPieValueFormatter: NSObject, ValueFormatter {
    public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        let val = Int(value).abbreviated
        return val
    }
}
