import Cocoa

var screen = NSScreen.main!.frame
for s in NSScreen.screens {
    if s.frame.width > screen.width {
        print("-screen: \(s.frame)")
        screen = s.frame
    } else {
        print("-screen: \(s.frame)")
    }
}

let top = 25
let x = screen.width >= 3000 ? Int(screen.width / 6) : 0
var pos = CGPoint(x: Int(screen.minX) + x, y: Int(screen.minY) + top)
var size = CGPoint(x: Int(screen.width)-2*x, y: Int(screen.height)-top)
var output = ""

var allowedOwners = ["iTerm", "iTerm2", "Google Chrome", "Safari", "Code", "Visual Studio Code", "Slack", "Finder", "Sublime Text", "PyCharm", "IntelliJ IDEA", "Xcode", "Terminal", "Atom", "Slack", "Obsidian", "Spotify", "Messages", "Mail", "Calendar", "Notes", "Reminders", "System Settings", "Activity Monitor", "Preview", "Skype", "WhatsApp"]
do {
    var owners: [String] = []
    for o in allowedOwners {
        owners.append(o)
        owners.append(o + ".app")
    }
    allowedOwners = owners
}

let options = CGWindowListOption(arrayLiteral: .excludeDesktopElements, .optionOnScreenOnly)
let windowList = CGWindowListCopyWindowInfo(options, kCGNullWindowID) as NSArray? as? [[String: AnyObject]]


for window in windowList! {
    if window[kCGWindowLayer as String] as! Int != 0 {
        continue
    }

    let owner = window[kCGWindowOwnerName as String] as! String
    let pid = window[kCGWindowOwnerPID as String] as? Int32

    // let bounds = window[kCGWindowBounds as String] as! [String: Int]
    // print("\(owner): \(bounds)")

    if !allowedOwners.contains(owner) {
        output += "skip \(owner); "
        print("skipping \(owner)")
        continue
    }

    let appRef = AXUIElementCreateApplication(pid!);

    var value: AnyObject?
    let result = AXUIElementCopyAttributeValue(appRef, kAXWindowsAttribute as CFString, &value)
    if result != AXError.success {
        print("error: \(result)")
        break
    }

    if let windowList = value as? [AXUIElement] {
        if let window = windowList.first {
            let axpos = AXValueCreate(AXValueType(rawValue: kAXValueCGPointType)!, &pos)!;
            AXUIElementSetAttributeValue(window, kAXPositionAttribute as CFString, axpos);

            let axsize = AXValueCreate(AXValueType(rawValue: kAXValueCGSizeType)!, &size)!;
            AXUIElementSetAttributeValue(window, kAXSizeAttribute as CFString, axsize);

            output += "\(owner); "
            print ("\(owner): \(pos), \(size)")
        }
    }
}
print (output + " \(pos.x) \(pos.y) \(size.x) \(size.y)")
