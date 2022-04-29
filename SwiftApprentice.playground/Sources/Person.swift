import Foundation

struct Person {
    public private(set) var first: String
    public private(set) var second: String
    
    public init(firstName: String, secondName: String) {
        first = firstName
        second = secondName
    }
    
    public var fullName: String {
        "\(first)  \(second)"
    }
}

open class ClassyPerson {
    public private(set) var first: String
    public private(set) var second: String
    
    public init(firstName: String, secondName: String) {
        first = firstName
        second = secondName
    }
    
    open var fullName: String {
        "\(first)  \(second)"
    }
}
