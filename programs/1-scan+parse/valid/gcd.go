package gcd

func gcd(a, b int) int {
    divisor := b
    while (divisor >= 1) {
        if (a % divisor == 0 && b % divisor == 0) {
            return divisor
        }
        divisor--
    }
    return 1
}

func gcd_iter(a, b int) {
    var remain int = a % b
    a = b
    b = remain
    while (remain > 0) {
        remain = a % b
        a = b
        b = remain
    }
    return a
}
