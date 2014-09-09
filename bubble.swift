// バブルソート
// 全ての要素に関して、隣接する要素と比較し順序が逆であれば入れ替える。これを要素数-1回繰り返す

import Foundation
import SortData

let data = SortData()

var end = true;

for i in 0...data.count-1 {
  end = true
  for j in 1...data.count-i-1 {
    if data[j] < data[j-1] {
      data.swap(j, j-1)
      end = false
    }
  }
  if end {
    break
  }
}
