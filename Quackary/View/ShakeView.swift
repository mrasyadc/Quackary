import SwiftUI

// An example view that responds to being shaken
struct ShakeView: View {
    @StateObject private var viewModel = ShakeViewModel()

    var body: some View {
        VStack {
            Text("Shake me!")
                .onShake {
                    viewModel.shakeDetected = true
                }

            if viewModel.shakeDetected {
                Text("Device shaken!")
                    .foregroundColor(.red)
                Button("Reset") {
                    viewModel.resetShake()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
