enum APIError: Error {
    case networkFailure
    case invalidData
    case genericError(Error)
}
