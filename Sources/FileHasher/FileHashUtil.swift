import Foundation
import CommonCrypto
/**
 * Wrapper around commoncrypt
 * - Note this is internal, use @testable if you need to test things
 * - Note: when you need to hash clipboard data: https://stackoverflow.com/questions/35749197/how-to-use-common-crypto-and-or-calculate-sha256-in-swift-2-3
 * - Fixme: ⚠️️ Move to own framework / repo, maybe name the repo FileHasherKit?
 */
final public class FileHashUtil {
   /**
    * - Abstract: we need a smaller hash of files than sha256 (because space is preciouce) like: "173539113", sha256 is very long: 235ef3f11f9d0d7e79c64c380f939b6b1c6c1ef7c34fceaa31075114c7280c49
    * ## Examples:
    * let fromFilePath: String = NSString(string: "~/Desktop/demo.mp3").expandingTildeInPath
    * guard let url:URL = URL.init(fileURLWithPath: fromFilePath)  else {Swift.print("err url");return}
    * Swift.print("hash:  \(FileHashUtil.truncatedHash(url: url))") // 173539113
    * - Fixme: ⚠️️ Find e persistent hash value becayse apple doc says: (Hash values are not guaranteed to be equal across different executions of, your program. Do not save hash values to use during a future execution)
    */
   public static func truncatedHash(url: URL) -> String? {
      guard let hash: String = sha256(url: url) else { return nil }
//      guard let data: Data = hash.data(using: .utf8) else { return nil }
      return "\(hash.djb2hash)"
   }
}
/**
 * Private static helper methods
 */
extension FileHashUtil {
   /**
    * Returns sha256 of a file
    * ## Examples:
    * sha256(url: url) // 235ef3f11f9d0d7e79c64c380f939b6b1c6c1ef7c34fceaa31075114c7280c49
    */
   private static func sha256(url: URL) -> String? {
      guard let digestData: Data = FileHashUtil.sha256(url: url) else { return nil } // digest data is much smaller than the real data
      return digestData.map { String(format: "%02hhx", $0) }.joined() // calculatedHash
   }
   /**
    * sha256
    */
   private static func sha256(url: URL) -> Data? {
      do {
         let bufferSize = 1024 * 1024
         let file = try FileHandle(forReadingFrom: url) // Open file for reading
         defer {
            file.closeFile()
         }
         var context = CC_SHA256_CTX() // Create and initialize SHA256 context
         CC_SHA256_Init(&context)
         while autoreleasepool(invoking: { // Read up to `bufferSize` bytes, until EOF is reached, and update SHA256 context:
            let data = file.readData(ofLength: bufferSize)/*Read up to `bufferSize` bytes*/
            if !data.isEmpty {
               data.withUnsafeBytes {
                  _ = CC_SHA256_Update(&context, $0, numericCast(data.count))
               }
               return true /*Continue*/
            } else {
               return false /*End of file*/
            }
         }) { }
         var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))/*Compute the SHA256 digest:*/
         digest.withUnsafeMutableBytes {
            _ = CC_SHA256_Final($0, &context)
         }
         return digest
      } catch {
         print(error)
         return nil
      }
   }
}
/**
 * String extension
 */
extension String {
   /**
    * djb2hash (persistant Hash accross excecutions)
    * - Note: We use this because Apples own: string.hashValue is not persistant across runs / builds
    * ## Examples:
    * "my-string".persistantHash
    */
   fileprivate var djb2hash: Int {
      return self.utf8.reduce(5381) {
         ($0 << 5) &+ $0 &+ Int($1)
      }
   }
}
