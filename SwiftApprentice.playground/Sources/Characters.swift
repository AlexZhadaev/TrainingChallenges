import Foundation

public enum GameCharacterType {
    case elf
    case giant
    case wizard
}

public protocol GameCharacter: AnyObject {
    var name: String { get }
    var hitPoints: Int { get set }
    var attackPoints: Int { get }
}

class Elf: GameCharacter {
    let name: String = "Noble Elf"
    var hitPoints: Int = 3
    let attackPoints: Int = 10
}

class Giant: GameCharacter {
    let name: String = "Mighty Giant"
    var hitPoints: Int = 10
    let attackPoints: Int = 3
}

class Wizard: GameCharacter {
    let name: String = "Wise Wizard"
    var hitPoints: Int = 5
    let attackPoints: Int = 5
}

public struct GameCharacterFactory {
    static public func make(ofType type: GameCharacterType) -> GameCharacter {
        switch type {
        case .elf:
            return Elf()
        case .giant:
            return Giant()
        case .wizard:
            return Wizard()
        }
    }
}

public func battle( _ firstFighter: GameCharacter, vs secondFighter: GameCharacter) -> String {
    var firstFighterHP = firstFighter.hitPoints
    var secondFighterHP = secondFighter.hitPoints
    var result: String = ""
    
    for _ in 1...10 {
        secondFighterHP -= firstFighter.attackPoints
        if secondFighterHP <= 0 {
            result = "\(secondFighter.name) defeated"
            break
        }
        firstFighterHP -= secondFighter.attackPoints
        if firstFighterHP <= 0 {
            result = "\(firstFighter.name) defeated"
            break
        }
    }
    
    return result
}
