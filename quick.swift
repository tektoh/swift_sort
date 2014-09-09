// クイックソート
// 1. ピボットとして一つ選びそれをPとする。
// 2. 左から順に値を調べ、P以上のものを見つけたらその位置をiとする。
// 3. 右から順に値を調べ、P以下のものを見つけたらその位置をjとする。
// 4. iがjより左にあるのならばその二つの位置を入れ替え、2.に戻る。ただし、次の2での探索はiの一つ右、次の3.での探索はjの一つ左から行う。
// 5. 2.に戻らなかった場合、iの左側を境界に分割を行って2つの領域に分け、そのそれぞれに対して再帰的に1からの手順を行う。要素数が1以下の領域ができた場合、その領域は確定とする。


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
    }(data[i], data[i + ((j - i) / 2)], data[j])
    while true {
      while data[i] < p { i++ }
      while data[j] > p { j-- }
      if i >= j { break }
      data.swap(i, j)
      i++
      j--
    }
    quicksort(left, i-1)
    quicksort(j+1, right)
  }
}

quicksort(0, data.count - 1)
