import Foundation

private func shuffle<T>(a: T, b: T) -> Bool {
    return drand48() > 0.5
}

public class SortData {

  internal var data: [Int]

  public var count: Int {
    get {
      return self.data.count
    }
  }

  public init(count: Int = 20) {
    self.data = Array(1...count)
    sort(&self.data, shuffle)
  }

  public subscript(i: Int) -> Int {
    get {
      return self.get(i)
    }
    set {
      self.set(i, newValue)
    }
  }

  private func indexIsValid(i: Int) -> Bool {
    return 0 <= i && i < self.count
  }

  public func get(i: Int) -> Int {
    assert(indexIsValid(i), "Index out of range")
    return self.data[i]
  }

  public func set(i: Int, _ newValue: Int) {
    assert(indexIsValid(i), "Index out of range")
    self.data[i] = newValue
  }

  public func swap(a: Int, _ b: Int) {
    let tmp = self.data[a]
    self.data[a] = self.data[b]
    self.data[b] = tmp

    self.printData()
  }

  public func sub(s: Int, _ e: Int, _ lst: [Int]) {
    var j = 0
    for i in s...e-1 {
      self.data[i] = lst[j++]
    }
    self.printData()
  }

  public func printData() {
    var bar: String = ""
    for var i: Int = 0; i < self.count; i++ {
      bar = String(count: self.data[i], repeatedValue: Character("="))
      println(NSString(format: "[%02d] \(bar)", i))
    }
    println("")

    usleep(100000)
  }
}
