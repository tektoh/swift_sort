// ヒープソート
// 1. 未整列のリストから要素を取り出し、順にヒープに追加する。すべての要素を追加するまで繰り返し。
// 2. ルート（最大値または最小値)を取り出し、整列済みリストに追加する。すべての要素を取り出すまで繰り返し。

import Foundation
import SortData

let data = SortData()

func parent(i: Int) -> Int {
  return (i + 1) / 2 - 1
}
func left(i: Int) -> Int {
  return (i + 1) * 2 - 1
}
func right(i: Int) -> Int {
  return (i + 1) * 2
}

var i = 0

// ヒープを構築
while ++i < data.count {
  var n = i
  while (n > 0) {
    let m = parent(n);
    if (data.get(m) < data.get(n)) {
      data.swap(m, n)
    } else {
      break
    }
    n = m;
  }
}

// ヒープを取り出す
while --i > 0 {
  data.swap(0, i)
  var n = i
  var m = 0
  var tmp = 0
  while true {
    let l = left(m)
    let r = right(m)

    if l >= n { break }

    if data.get(l) > data.get(tmp) {
      tmp = l
    }
    if (r < n) && (data.get(r) > data.get(tmp)) {
      tmp = r
    }

    if tmp == m { break }

    data.swap(tmp, m)

    m = tmp
  }
}
