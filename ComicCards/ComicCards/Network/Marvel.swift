
import Moya

public enum Marvel {
  // 1
  static private let publicKey = "7e1b85b58865467b3e920fc8b35897a6"
  static private let privateKey = "7036c62993dcbd6d0dc62d5224b993e1571fa45d"

  // 2
  case comics
}

extension Marvel: TargetType {
  // 1
  public var baseURL: URL {
    return URL(string: "https://gateway.marvel.com/v1/public")!
  }

  // 2
  public var path: String {
    switch self {
    case .comics: return "/comics"
    }
  }

  // 3
  public var method: Moya.Method {
    switch self {
    case .comics: return .get
    }
  }

  // 4
  public var sampleData: Data {
    return Data()
  }

  // 5
  public var task: Task {
    let ts = "\(Date().timeIntervalSince1970)"
      // 1
      let hash = (ts + Marvel.privateKey + Marvel.publicKey).md5

      // 2
      let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash]

      switch self {
      case .comics:
        // 3
        return .requestParameters(
          parameters: [
            "format": "comic",
            "formatType": "comic",
            "orderBy": "-onsaleDate",
            "dateDescriptor": "lastWeek",
            "limit": 50] + authParams,
          encoding: URLEncoding.default)
      }
  }

  // 6
  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }

  // 7
  public var validationType: ValidationType {
    return .successCodes
  }
}
