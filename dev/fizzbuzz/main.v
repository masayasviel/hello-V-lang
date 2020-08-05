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