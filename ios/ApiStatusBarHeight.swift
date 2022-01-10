@objc(ApiStatusBarHeight)
class ApiStatusBarHeight: NSObject {
    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }

    @objc(getStatusBarHeight:withRejecter:)
    func getStatusBarHeight(resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        DispatchQueue.main.sync {
            var statusBarHeight: CGFloat = 0
            if #available(iOS 13.0, *) {
                let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            } else {
                statusBarHeight = UIApplication.shared.statusBarFrame.height
            }
            resolve(statusBarHeight)
        }
    }
}