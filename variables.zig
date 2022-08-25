const @"identifier with spaces in it" = 0xff;
const @"1SmallStepForMen" = 12345678;
const print = std.debug.print;
const std = @import("std");
const expect = std.testing.expect;
const assert = std.debug.assert;
const c = @import("std").c;

threadlocal var xx: i32 = 1234;

pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, bug: *c.Stat) c_int;

const Color = enum {
    red,
    @"really red",
};
const color: Color = .@"really red";

var y: i32 = add(10,x);
const x: i32 = add(12,34);

test "container level" {
    try expect(x==46);
    try expect(y == 56);

}

test "static local" {
    try expect(foo() == 1235);
    try expect(foo() == 1236);
}

test "thread local" {
    const thread1 = try std.Thread.spawn(.{}, testTls, .{});
    const thread2 = try std.Thread.spawn(.{}, testTls, .{});
    testTls();
    thread1.join();
    thread2.join();

}

test "comptime vars" {
    var xxx: i32 = 1;
    comptime var yyy: i32 = 1;
    xxx += 1;
    yyy += 1;

    try expect(xxx == 2);
    try expect(yyy == 2);

    if (yyy != 2) {
        @compileError("Wrong y value");
    }

}

fn testTls() void {
    assert(xx == 1234);
    xx += 1;
    assert(xx == 1235);

}

fn foo() i32 {
    const S = struct {
        var x: i32 = 1234;
    };
    S.x += 1;
    return S.x;
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn main() void {
    print("Whatever",.{});

}