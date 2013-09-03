local ddp = require 'ddp'

ddp.p(1)

t = {
    1, 2, 3
}

ddp.p(t)

t = {
    k1 = "v1",
    k2 = "v2",
    k3 = "v3"
}

ddp.p(t)

t = {
    k1 = "v1",
    k2 = "v2",
    s1 = {
        1,2,3
    }
}

ddp.p(t)

t = {
    'helloworld',
    hello = 'world',
    sub = {
        1, 2, 3
    },
    subsub = {
        123,
        123,
        haha = {
            123,
            123
        }
    }
}

ddp.p(t)

ddp.p(ddp)
