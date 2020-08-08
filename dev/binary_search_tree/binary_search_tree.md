# binary search tree

2020/08/08

## 構造体

```v
struct 構造体名 {
// 非公開 イミュータブル (デフォルト) 
    member1 type
    member2 type
// アクセス指定子
mut: // 非公開 ミュータブル
pub: // 公開 イミュータブル (読み取り専用) 
pub mut: // 公開 親モジュールでのみミュータブル 
__global: // 公開かつ親モジュールの内側でも外側でもミュータブル(非推奨)
}
```

## 初期化(仮)

よくわかっていない

```v
int(0)
Node(0)
```

## ポインタ

宣言

```v
&変数
```

アドレスを見る

```v
ptr_str(Node) // return string
```

`0`で初期化できる

参考：[calculator.v](https://github.com/vlang/ui/blob/master/examples/calculator.v)

## 配列

```v
arr := [1,2,3,4,5,6,7,8,9]
arr := []type{} // 初期化
```

引数で受け取る & 返り値

```v
fn function(arr []int) []int {
    mut new_arr := [3,3,3]
    new_arr << arr
    return new_arr
}
```

アクセス

```v
arr[idx]
arr.len // arr.size
arr.first() // arr[0]
arr.last() // arr[arr.len-1]
```

push

```v
arr << num
```

pop

```v
fn pop(arr []int) (int, []int) {
	return arr.last(), arr[0..arr.len-1]
}
```

unshift

```v
fn unshift(arr []int, data int) []int {
	mut res := [data] 
	res << arr
	return res
}
```

shift

```v
fn shift(arr []int) (int, []int) {
	return arr.first(), arr[1..arr.len]
}
```

## 二分探索木

```v
/* 
構造体でNodeを宣言
valueは変わらないモノとしてみる
*/
struct Node {
	value int
pub mut:
	left &Node = 0 // 初期化
	right &Node = 0 // 初期化
}

/*
Node Objectを作る
ヒープ領域に展開したいのでポインタを返す
*/
fn generate_node(val int) &Node {
	return &Node{value:val}
}

// 値を挿入する
fn (n &Node) insert(data int) {
	mut current := n
	new_node := generate_node(data)
	for {
		if current.value > data {
			if current.left == 0 {
				current.left = new_node
				return
			} else {
				current = current.left
			}
		} else {
			if current.right == 0 {
				current.right = new_node
				return
			} else {
				current = current.right
			}
		}
	}
}

// 幅優先探索
fn (root &Node) bfs() []int {
	mut data := []int{}
	mut queue := [root]
	mut n := &Node(0) // `mut n := 0`だとエラーになる
    /*
    上記のshift()でやると`Unhandled Exception 0xC0000374`と出るのでindexで管理
    */
	mut idx := 0
	for queue.len > idx {
		n = queue[idx]
		data << n.value
		if n.left != 0 {
			queue << n.left
		}
		if n.right != 0 {
			queue << n.right
		}
		idx++
	}
	return data
}

fn main() {
	mut nums := [44, 56, 17, 98, 11, 3, 70, 8]
	mut root := generate_node(nums[0])
	for i in 1..nums.len {
		root.insert(nums[i])
	}
	elms := root.bfs()
	println(elms) // [44, 17, 56, 11, 98, 3, 70, 8]
}
```

## 参考
- [issues/4612](https://github.com/vlang/v/issues/4612)