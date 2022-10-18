import Foundation

func getAPIKey() -> String? {
    guard let infoDictionary = Bundle.main.infoDictionary else {
        return nil
    }
    guard let apiKey = infoDictionary["APIKey"] as? String else {
        return nil
    }
    return apiKey
}
