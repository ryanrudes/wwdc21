import Foundation

struct Event: Hashable {
    let time: String
    let info: String
    let link: String
    let kind: Category
    let caption: String
    
    init(time: String, info: String, link: String = "", kind: Category, caption: String = "") {
        self.time = time
        self.info = info
        self.link = link
        self.kind = kind
        self.caption = caption
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.info == rhs.info
    }
}
