const std = @import("std");
const expect = std.testing.expect;
const mem = std.mem;

test "variable declaration" {
    var a: u8 = 1;
    var b: u16 = a;
    _ = b;
}

test "function call" {
    var a: u8 = 1;
    foo(a);
}

fn foo(b: u16) void {
    _ = b;
}

test "builtin" {
    var a: u8 = 1;
    var b = @as(u16, a);
    _=b;
}

test "peer resolve widening" {
    var a: i8 = 12;
    var b: i16 = 34;
    var c = a + b;
    try expect(c == 46);
    try expect(@TypeOf(c) == i16);
}

test "peer resolve arrays" {
    try expect(mem.eql(u8, boolToStr(true),"true"));
}

fn boolToStr(b: bool) []const u8 {
    return if (b) "true" else "false";
}