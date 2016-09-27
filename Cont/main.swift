import Foundation

print(plus(1, plus(2, 3)))

print(plus_k(1, 2, { r in r + 3 }))

print(plus_k(1, 2, { r in plus_k(r, 3, { x in x }) }))

print(plus_k(1, 2, { x in
    plus_k(x, 3, { y in
        plus_k(y, 4, { z in
            plus_k(z, 5, { a in
                a
            })
        })
    })
})
)

print(plus_cont(1, 2).run { x in x })

print(
    plus_cont(1, 2).flatMap { x in plus_cont(x, 3) }.run { x in x }
)

print(
    plus_cont(1, 2).flatMap(plus_cont_curry(3)).run { x in x }
)

print(
    plus_cont(1, 2).flatMap(plus_cont_curry(3))
                   .flatMap(plus_cont_curry(4))
                   .flatMap(plus_cont_curry(5))
                   .run { x in x }
)

print(
    (plus_cont(1, 2) >>>= plus_cont_curry(3)
                     >>>= plus_cont_curry(4)
                     >>>= plus_cont_curry(5))
                     .run { x in x }
)

let _: Cont<Int, String> = (plus_cont(1, 2) >>>= plus_cont_curry(3)).map(int_to_string)

print(
    add_hello("world!").flatMap(count).flatMap(plus_cont_curry(10)).run { x in x }
)

print(
    (add_hello("world!") >>>= count >>>= plus_cont_curry(10)).run { x in x }
)
