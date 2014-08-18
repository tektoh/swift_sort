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

func quicksort(left: Int, right: Int) {
  if left < right {
    var i = left
    var j = right
    let p = { (a: Int, b: Int, c: Int) -> Int in
      if a < b {
        if b < c { return b } else if c < a { return a } else { return c }
      } else {
        if c < b { return b } else if a < c { return a } else { return c }
      }
    }(data.get(i), data.get(i + ((j - i) / 2)), data.get(j))
    while true {
      while data.get(i) < p { i++ }
      while data.get(j) > p { j-- }
      if i >= j { break }
      data.swap(i, b: j)
      i++
      j--
    }
    quicksort(left, i-1)
    quicksort(j+1, right)
  }
}

quicksort(0, data.count - 1)
