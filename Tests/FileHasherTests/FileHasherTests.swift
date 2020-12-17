import XCTest
import FileHasher
import ResourceHelper

class FileHasherTests: XCTestCase {
   func testExample() {
      XCTAssertTrue(hashTest())
      XCTAssertTrue(dataTest())
   }
}
extension FileHasherTests {
   /**
    * hashTest
    * - Fixme: ⚠️️ maybe compare txt byte for byte
    */
   func hashTest() -> Bool {
      let url: URL = ResourceHelper.projectRootURL(projectRef: #file, fileName: "temp.bundle/demo.mp3")
      guard let trucatedFileHash: String = FileHashUtil.truncatedHash(url: url) else { Swift.print("err"); return false }
      let integrity: Bool = trucatedFileHash == "5949001440284795020"
      Swift.print("Test fileHash done: \(integrity ? "✅" : "🚫")")
      return integrity
   }
   /**
    *
    */
   func dataTest() -> Bool {
//      Swift.print("dataTest")
      let shaData: Data? = "Here is the test string".data(using: .utf8)?.sha256
      let shaHex: String? =  shaData?.map { String(format: "%02hhx", $0) }.joined()
//      print("shaHex: \(String(describing: shaHex))")
      let integrity: Bool = shaHex == "6f5c446883a3049caf8368b4bad2d2ff045a39d467ee20a8d34d5698e649fe21"
      Swift.print("Test data hash done: \(integrity ? "✅" : "🚫")")
      return integrity
   }
}
