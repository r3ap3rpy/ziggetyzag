const print = std.debug.print;
const std = @import("std");

const decimal_int = 10;
const hex_int = 0xff;
const octal_int = 0o755;
const binary_int = 0b11110000;

const billion = 1_000_000_000;
const binary_mask = 0b1_1111_1111;

fn divide(a: i32, b: i32) i32 {
    return a / b;
}

pub fn main() void {
    print("billion: {d}", .{billion});
    //print("divide: {d}", .{divide(10,20)});
}