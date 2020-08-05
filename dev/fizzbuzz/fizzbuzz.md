# fizzbuzz

## 変数

```v
a := 1 // 変数の初期化
mut b := 2 // 再代入を許す変数
b = 3 // 再代入は := ではなく =
```

## 条件分岐

```v
if a == 10 {
    println("a is 10")
} else if a >= 5 {
    println("a is more than 5")
} else {
    println("a is less than 5")
}
```

## ループ

`for`のみ

### while

```v
for 条件 {
    /* while */
}
```

### loop

```v
for {
    /* loop */
}
```

### for i in range(5)

```v
for i in 0..5 {
    /* range */
}
```

### C like

```v
for i := 1; i <= 10; i++ {
    /* C like */
}
```

## function

```v
fn 関数名(引数 型) 返り値の型 {
	return 返り値
}
```

## fizzbuzz

[公式](https://github.com/vlang/v/blob/master/examples/fizz_buzz.v)

```v
fn main() {
	mut s := ''
	for n in 1 .. 101 {
		if n % 3 == 0 {
			s += 'Fizz'
		}
		if n % 5 == 0 {
			s += 'Buzz'
		}
		if s == '' {
			println(n)
		}
		else {
			println(s)
		}
		s = ''
	}
}
```

自己流

```v
fn fizzbuzz(i int) string {
	mut s := ""
	if i % 3 == 0 {
		s += "fizz"
	}
	if i % 5 == 0 {
		s += "buzz"
	}
	if s == "" {
		s = i.str()
	}
	return s
}

fn main() {
	for i := 1; i <= 10; i++ {
		println(fizzbuzz(i))
	}
}
```