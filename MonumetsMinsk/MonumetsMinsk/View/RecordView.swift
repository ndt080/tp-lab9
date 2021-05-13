import SwiftUI

struct RecordView: View {
    var obj: Monument

    var body: some View {
        HStack() {
            Image(obj.image)
                .resizable()
                .frame(width: 110, height: 70)
                .cornerRadius(6.0)
            VStack(alignment: .leading, spacing: 3) {
                Text(obj.name).font(.headline)
            }
        }
    }
}
