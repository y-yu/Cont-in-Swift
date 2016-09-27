func plus(_ x: Int, _ y: Int) -> Int {
    return x + y
}

func plus_k(_ x: Int, _ y: Int, _ k: (Int) -> Int) -> Int {
    return k(x + y)
}

func plus_cont(_ x: Int, _ y: Int) -> Cont<Int, Int> {
    return Cont { k in k(x + y) }
}

func plus_cont_curry(_ x: Int) -> (Int) -> Cont<Int, Int> {
    return { y in plus_cont(x, y) }
}
