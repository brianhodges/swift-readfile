import Foundation

struct Team {
    let name: String
    let super_bowl_wins: Int
    
    init(name: String, super_bowl_wins: Int) {
        self.name = name
        self.super_bowl_wins = super_bowl_wins
    }
}
