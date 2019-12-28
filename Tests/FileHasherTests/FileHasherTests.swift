import XCTest
import FileHasher

class FileHasherTests: XCTestCase {
   override func setUp() {
      super.setUp()
   }
   override func tearDown() {
      super.tearDown()
   }
   func testExample() {
      XCTAssertEqual("Hello, World!", "Hello, World!")
      // add NetworkSugar, download the mp3 to a temp folder and check the hash, because spm and bundle 🤷
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
extension FileHasherTests {
   /**
    * hashTest
    * - Fixme: ⚠️️ maybe compare txt byte for byte
    */
   public static func hashTest() -> String? {
      //      let fromFilePath:String = NSString(string: "~/Desktop/demo.mp3").expandingTildeInPath
      let fromFilePath: String = "\(Bundle.main.resourcePath!)/temp.bundle/demo.mp3"//NSString(string: "~/Desktop/complexContent.txt").expandingTildeInPath // let fromFilePath: String = NSString(string: "~/Desktop/tester.txt").expandingTildeInPath
      //      let fromFilePath:String = "/var/folders/j_/2ghwmc6d6555x9_zn680jgl40000gn/T/test.txt"
      /*guard */let url: URL = .init(fileURLWithPath: fromFilePath)// else { Swift.print("err url"); return }
      guard let trucatedFileHash: String = FileHashUtil.truncatedHash(url: url) else { Swift.print("err"); return nil }
      //      Swift.print("hash: \(trucatedFileHash)")
      return trucatedFileHash // 5949001440284795020
   }
}
