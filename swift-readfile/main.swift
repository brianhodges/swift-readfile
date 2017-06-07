import Foundation

func main() {
    var teams = [Team]()
    let filename = "swift-readfile/top3list.csv"

    print("Filename: " + filename)
    print()
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let path = dir.appendingPathComponent(filename)

        do {
            let data = try String(contentsOf: path, encoding: String.Encoding.utf8)
            let top3array = data.components(separatedBy: CharacterSet.newlines)
            for line in top3array {
                var pieces = line.components(separatedBy: ",")
                let name : String = pieces[0]
                let super_bowl_wins : Int = Int(pieces[1])!
                teams.append(Team(name: name, super_bowl_wins: super_bowl_wins))
            }
        } catch let error as NSError {
            print("Something went wrong: \(error)")
        }
    }

    for team in teams {
        let s = ("| Team: " + team.name + " |").characters.count - 2
        print("+" + String(repeating: "-", count: s) + "+")
        print("| Team: " + team.name + " |")
        let ws = ("| Super Bowl Wins: " + String(team.super_bowl_wins)).characters.count
        print("| Super Bowl Wins: " + String(team.super_bowl_wins) + String(repeating: " ", count: (s - ws)) + " |")
        print("+" + String(repeating: "-", count: s) + "+")
        print()
    }
}

main()
