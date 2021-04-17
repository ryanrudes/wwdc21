import SwiftUI
import SafariServices

struct WebView: UIViewControllerRepresentable {
    let url: URL
    let reader: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        let config = SFSafariViewController.Configuration()
        if reader {
            config.entersReaderIfAvailable = true
        }
        return SFSafariViewController(url: url, configuration: config)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {

    }
}
