package gcd

func gcd(a, b int) int {
    divisor := b
    for (divisor >= 1) {
        if (a % divisor == 0 && b % divisor == 0) {
            return divisor
        }
        divisor--
    }
    return 1
}

func gcd_iter(a, b int) {
    remain := a % b
    a = b
    b = remain
    for (remain > 0) {
        remain = a % b
        a = b
        b = remain
    }
    return a
}
