struct Cont<R, A> {
    let run: ((A) -> R) -> R
    
    init(_ f: @escaping ((A) -> R) -> R) {
        self.run = f
    }
    
    func flatMap<B>(_ f: @escaping (A) -> Cont<R, B>) -> Cont<R, B> {
        return Cont<R, B> {
            k in self.run { a in f(a).run(k) }
        }
    }
    
    func map<B>(_ f: @escaping (A) -> B) -> Cont<R, B> {
        return Cont<R, B> {
            k in self.run { a in k(f(a)) }
        }
    }
}

precedencegroup Left {
    associativity: left
}

infix operator >>>=: Left

func >>>=<R, A, B>(_ ma: Cont<R, A>, _ f: @escaping (A) -> Cont<R, B>) -> Cont<R, B> {
    return ma.flatMap(f)
}
