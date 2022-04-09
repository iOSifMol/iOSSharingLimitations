// MIT License
//
// Copyright (c) 2022 Iosif
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import UIKit

class ShareManager: NSObject {
  func share() {
    let activityViewController = UIActivityViewController(activityItems: ["Share test example", self],
                                                          applicationActivities: nil)
    let appWindow = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
    appWindow?.rootViewController?.present(activityViewController, animated: true, completion: nil)
  }
}

extension ShareManager: UIActivityItemSource {
  func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
    "test_plamceholder"
  }
  
  func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
    switch activityType?.rawValue {
    case UIActivity.ActivityType.mail.rawValue:
      return htmlExample
    case "com.google.Gmail.ShareExtension":
      return "Share Gmail text"
    default:
      return nil
    }
  }
  
  
}

// MARK: - Mocks
extension ShareManager {
  private var htmlExample: String {
  """
  <html>
     <body>
        <h1 style="color:blue;">Some test html text</h1>
     </body>
  </html>
  """
  }
}
