![Lang](https://img.shields.io/badge/Language-Swift-orange.svg)
![platform](https://img.shields.io/badge/Platform-iOS/macOS-blue.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![codebeat badge](https://codebeat.co/badges/68f513fe-ab51-4adc-a2d5-57fc80bf945f)](https://codebeat.co/projects/github-com-eonist-filehasher-master)
![Tests](https://github.com/eonist/FileHasher/workflows/Tests/badge.svg)

# FileHasher 🧬
- Produce small hash of files I.e: "173539113" 
- In contrast sha256 is very long: 235ef3f11f9d0d7e79c64c380f939b6b1c6c1ef7c34fceaa31075114c7280c49
- Filehasher is very fast and makes persistant hashes across devices and sessions (unlike apples own)

### Installation:
- SPM: `.url("https://github.com/eonist/FileHasher.git"), .branch("master")`

### Examples:
```swift
let fromFilePath: String = NSString(string: "~/Desktop/demo.mp3").expandingTildeInPath
guard let url:URL = URL.init(fileURLWithPath: fromFilePath)  else { Swift.print("err url"); return }
Swift.print("hash:  \(FileHashUtil.truncatedHash(url: url))") // 173539113
```
