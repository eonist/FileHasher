import XCTest
import FileHasher
import ResourceHelper

class FileHasherTests: XCTestCase {
   func testExample() {
      XCTAssertTrue(hashTest())
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
      Swift.print("Test done: \(integrity ? "✅" : "🚫")")
      return integrity
   }
}
