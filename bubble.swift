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

let data = SortData()

var end = true;

for i in 0...data.count-1 {
  end = true
  for j in 1...data.count-i-1 {
    if data.get(j) < data.get(j-1) {
      data.swap(j, b: j-1)
      end = false
    }
  }
  if end {
    break
  }
}
