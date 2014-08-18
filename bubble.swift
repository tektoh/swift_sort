import Foundation
import SortData

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
