import Foundation

class SortData {

  var data: [Int]
  var count: Int {
    get {
      return self.data.count
    }
  }

  init(count: Int = 20) {
    self.data = [Int]()
    for _ in 1...count {
      self.data.append(Int(arc4random() % UInt32(count)) + 1)
    }
  }

  func get(i: Int) -> Int {
    return self.data[i]
  }

  func swap(a: Int, b: Int) {
    let tmp = self.data[a]
    self.data[a] = self.data[b]
    self.data[b] = tmp

    self.printData()
    usleep(100000)
  }

  func printData() {
    var bar: String = ""
    for var i: Int = 0; i < self.count; i++ {
      bar = ""
      for _ in 1...self.data[i] {
        bar += "="
      }
      println(NSString(format: "[%02d] \(bar)", i))
    }
    println("")
  }
}
