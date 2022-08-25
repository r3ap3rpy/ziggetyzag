// f16 ->binary 16
// f32 -> binary 32
// f64 -> binary 64
// f80 -> 80 bit extended
// f128 -> binary 128
// c_longdouble -> long double
const std = @import("std");
const big = @as(f64, 1 << 40);

const floating_point = 123.0E+77;
const another_point = 123.0;
const yet_ansther = 123.0e+77;

const hex_float = 0x103.70p-5;

const lightspeed = 299_792_458.000_000;

const infinity = std.math.inf(f32);
const negative_infinity = -std.math.inf(f64);
const nan = std.math.nan(f128);

export fn foo_strict(x: f64) f64 {
    return x + big - big;
}

export fn foo_optimized(x: f64) f64 {
    @setFloatMode(.Optimized);
    return x + big - big;
}