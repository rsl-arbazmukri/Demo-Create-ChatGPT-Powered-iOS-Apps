import Foundation

class OpenAIService {
    
    private enum API {
        static let Chat = "http://localhost:5000/chat"
    }
    
    func response(for messages: [ChatMessage]) async throws -> String {
        let messagesData = messages.map { $0.toServiceData() }
        let request = try request(url: API.Chat, body: messagesData)
        let (data, _) = try await URLSession.shared.data(for: request)
                
        if let responseString = String(data: data, encoding: .utf8) {
            return responseString
        } else {
            throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
        }
    }
    
    private func request(url: String, body: [[String: String]]) throws -> URLRequest {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        
        return request
    }
}
