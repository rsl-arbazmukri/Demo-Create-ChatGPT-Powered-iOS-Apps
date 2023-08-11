import SwiftUI

struct MessageTileView: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isUserMessage {
                Spacer()
                Text(message.text)
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .alignmentGuide(.leading) { _ in
                        15
                    }
            } else {
                Text(message.text)
                    .padding(10)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .alignmentGuide(.trailing) { _ in
                        -15
                }
                Spacer()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
    }
}
