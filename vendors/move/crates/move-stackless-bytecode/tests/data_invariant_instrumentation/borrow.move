module 0x42::Test {
    struct R<T> has key {
        x: u64,
        s: S,
        t: T,
    }

    struct S has copy, drop, store {
        y: u64
    }

    spec R {
        invariant x > s.y;
    }

    spec S {
        invariant y > 0;
    }

    public fun test_borrow_mut_local(): R<u64> {
        let d = R{x: 2, s: S{y:1}, t: 0};
        let r = &mut d;
        r.s.y = 2;
        r.x = 3;
        d
    }
}
