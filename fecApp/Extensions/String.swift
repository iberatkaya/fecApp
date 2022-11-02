import Foundation

extension String {
    // Taken from https://stackoverflow.com/a/53449185
    func currencyFormatting(hideCents: Bool = false) -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = hideCents ? 0 : 2
            formatter.minimumFractionDigits = hideCents ? 0 : 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}
