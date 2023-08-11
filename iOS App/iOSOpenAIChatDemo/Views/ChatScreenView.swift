import SwiftUI

struct ChatScreenView: View {

    @State var messages: [ChatMessage] = []
    @State var newMessageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(messages) { message in
                        MessageTileView(message: message)
                    }
                }
                .padding()
            }
            Spacer()
            HStack {
                TextField("Type a message", text: $newMessageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
    }
    
    private func sendMessage() {
        let userMessage = ChatMessage(text: newMessageText, isUserMessage: true)
        messages.append(userMessage)
        
        Task {
            var response: String
            var aiMessage = ChatMessage(text: "", isUserMessage: false)
            do {
                response = try await OpenAIService().response(for: messages)
                newMessageText = ""
            } catch {
                response = error.localizedDescription
            }

            aiMessage.text = response
            messages.append(aiMessage)
        }
    }
}

