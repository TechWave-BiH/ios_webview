
import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration();
        configuration.mediaTypesRequiringUserActionForPlayback = []
        configuration.allowsInlineMediaPlayback = true
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        
        let embeddedCode =
        """
        <html><head><meta name=\"viewport\" content=\"width=device-width, maximum-scale=1, user-scalable=yes, initial-scale=1.0\"><title>Video Test / EMP-SAM / 15/01/23</title></head><body style=\"margin: auto;\"><center><ins data-do=\"app.legaseriea.it\" data-domain=\"techwave.io\" data-id=\"6d3674c49af4071e414d4adbab038085\" data-type=\"video-template-single\" data-video=\"lazio-milan-21-01-2023\"></ins><script async src=\"https://bb1.broadbandy.net/display/app.js\"></script></center></body></html>
        """
        /*
        if let url = Bundle.main.url(forResource: "tag", withExtension: "html") {
            webView.load(URLRequest(url: url))
        }
         */
        guard let baseURL = URL(string: "https://app.legaseriea.it") else { return }
        webView.loadHTMLString(embeddedCode, baseURL: baseURL)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        webView.frame = view.bounds;
    }
    
    /*func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url {
                UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil) //UIApplication.shared.open(url)
                print(url)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        } else {
            decisionHandler(.allow)
        }
    }*/
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil)
        return nil
      }


}

