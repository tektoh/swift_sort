// ストゥージソート
// 1. もし末尾の値が先頭の値より小さければ、それらを入れ替える。
// 2. 現在処理している部分列の要素数が3以上であれば、
//     * リストの先頭2/3に対してストゥージソートを行う。
//     * リストの末尾2/3に対してストゥージソートを行う。
//     * リストの先頭2/3に対して再びストゥージソートを行う。
// 3. そうでなければ終了。

import Foundation
import SortData

let data = SortData()

func stoogesort(i: Int, j: Int) {
  if data.get(j) < data.get(i) {
    data.swap(i, j)
  }
  let k = j - i + 1
  if k >= 3 {
    let t = k / 3
    stoogesort(i, j - t)
    stoogesort(i + t, j)
    stoogesort(i, j - t)
  }
}

stoogesort(0, data.count - 1)
