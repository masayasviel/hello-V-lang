struct Node {
	value int
pub mut:
	left &Node = 0
	right &Node = 0
}

fn generate_node(val int) &Node {
	return &Node{value:val}
}

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

fn (root &Node) bfs() []int {
	mut data := []int{}
	mut queue := [root]
	mut n := &Node(0)
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
	println(elms)
}