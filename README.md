![Lang](https://img.shields.io/badge/Language-Swift-orange.svg)
![platform](https://img.shields.io/badge/Platform-iOS/macOS-blue.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![Github actions badge](https://badgen.net/github/checks/eonist/FileHasher?icon=github&label=Build%20Status)](https://github.com/eonist/FileHasher/actions)

# FileHasher
Hashing of files (fast)

### Installation:
- SPM: `.url("https://github.com/eonist/FileHasher.git"), .branch("master")`

### Examples:
```swift
let fromFilePath: String = NSString(string: "~/Desktop/demo.mp3").expandingTildeInPath
guard let url:URL = URL.init(fileURLWithPath: fromFilePath)  else { Swift.print("err url"); return }
Swift.print("hash:  \(FileHashUtil.truncatedHash(url: url))") // 173539113
```
