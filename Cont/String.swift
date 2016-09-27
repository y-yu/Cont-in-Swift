import Foundation

func int_to_string(_ n: Int) -> String {
    return String(n)
}

func add_hello(_ str: String) -> Cont<Int, String> {
    return Cont { k in k("hello" + str) }
}

func count(_ str: String) -> Cont<Int, Int> {
    let n = str.characters.count
    return Cont { k in k(n) }
}
