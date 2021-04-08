import Foundation

struct Event: Hashable {
    let time: String
    let info: String
    let category: Category
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.info == rhs.info
    }
}
