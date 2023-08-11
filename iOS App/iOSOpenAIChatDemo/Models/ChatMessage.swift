import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    var text: String
    var isUserMessage: Bool
    
    func toServiceData() -> [String: String] {
        let key = isUserMessage ? "HumanMessage" : "AIMessage"
        let value = text
            
        return [key: value]
    }
}
