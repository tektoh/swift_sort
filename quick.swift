import Foundation
import SortData

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
