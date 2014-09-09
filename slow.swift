// スローソート
// 1. 配列の左半分の内、一番大きいものを見つける（Aとする）
// 2. 配列の右半分の内、一番大きいものを見つける（Bとする）
// 3. もし、A>Bなら両者を交換する
// 4. 配列の要素数-1の範囲で再度「1.」～「3.」を繰り返す

import Foundation
import SortData

let data = SortData()

func slowsort(i: Int, j: Int) {
  if i < j {
    let m = (i + j) / 2

    slowsort(i, m)
    slowsort(m + 1, j)

    if data.get(m) > data.get(j) {
      data.swap(m, j)
    }

    slowsort(i, j - 1)
  }
}

slowsort(0, data.count - 1)
