import Foundation

public protocol BuilderProtocol {

  associatedtype ResponseType: Decodable
  associatedtype ModelType

  func build(response: ResponseType) throws -> ModelType
}
