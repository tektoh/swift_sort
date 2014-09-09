// マージソート
// 1. データ列を分割する
// 2. 各々をソートする
// 3. 二つのソートされたデータ列をマージする

import Foundation
import SortData

let data = SortData()

func mergesort(lst: (Int, Int)) -> (Int, Int) {
  if lst.1 - lst.0 <= 1 {
    return lst
  }
  let m = (lst.0 + lst.1) / 2
  return merge(mergesort((lst.0, m)), mergesort((m, lst.1)))
}

func merge(lst1: (Int, Int), lst2: (Int, Int)) -> (Int, Int) {
  let len1 = lst1.1 - lst1.0
  let len2 = lst2.1 - lst2.0

  var lst = [Int]()
  for var i = lst1.0; i < lst2.1; i++ {
    lst.append(data.get(i))
  }

  var a = data.get(lst1.0)
  var b = data.get(lst2.0)

  var i = 0
  var j = 0
  var k = 0

  while true {
    if a <= b {
      lst[i] = a
      i++
      j++
      if j >= len1 { break }
      a = data.get(lst1.0 + j)
    } else {
      lst[i] = b
      i++
      k++
      if k >= len2 { break }
      b = data.get(lst2.0 + k)
    }
  }
  while j < len1 {
    lst[i] = data.get(lst1.0 + j)
    i++
    j++
  }
  while k < len2 {
    lst[i] = data.get(lst2.0 + k)
    i++
    k++
  }

  data.sub(lst1.0, lst2.1, lst)

  return (lst1.0, lst2.1)
}

mergesort((0, data.count))
