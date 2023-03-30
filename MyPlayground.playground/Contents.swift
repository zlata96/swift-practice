import Foundation
class TimeFormatter {

    // MARK: - Initialization
    public init() {}

    // MARK: - Public Methods
    public func format(_ seconds: Int, isShortFormat: Bool) -> String {
        if isShortFormat {
            return formatForTimer(with: seconds)
        } else {
            return formatForAlert(with: seconds)
        }
    }

    // MARK: - Private Methods
    func formatForTimer(with seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds - hours * 3600) / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func formatForAlert(with seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds - hours * 3600) / 60
        let seconds = seconds % 60
        if hours > 0 && minutes > 0 {
            return String(format: "%d ч. %d мин.", hours, minutes)
        } else if hours > 0 {
            return String(format: "%d ч.", hours)
        } else if minutes > 0 {
            return String(format: "%d мин.", minutes)
        } else {
            return String(format: "%d сек", seconds)
        }
    }

}

var timeformatter = TimeFormatter().format(7800, isShortFormat: false)
print(timeformatter)
