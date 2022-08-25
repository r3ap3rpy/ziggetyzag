const expect = @import("std").testing.expect;
const std = @import("std");
const builtin = @import("builtin");

test "address syntax" {
    const x: i32 = 1234;
    const x_ptr = &x;

    try expect(x_ptr.* == 1234);
    try expect(@TypeOf(x_ptr) == *const i32);
    var y: i32 = 5678;
    const y_ptr = &y;
    try expect(@TypeOf(y_ptr) == *i32);
    y_ptr.* += 1;
    try expect(y_ptr.* == 5679);
}

test "array access" {
    var array = [_]u8{1,2,3,4,5,6,7,8,9,10};
    const ptr = &array[2];
    try expect(@TypeOf(ptr) == *u8);
    ptr.* += 1;
    try expect(array[2] == 4);

}

test "comptime" {
    comptime {
        var x: i32 = 1;
        const ptr = &x;
        ptr.* += 1;
        x += 1;
        try expect(ptr.* == 3);
    }
}

test "int addr to pointer" {
    const ptr = @intToPtr(*i32, 0xdeadbee0);
    const addr = @ptrToInt(ptr);
    try expect(@TypeOf(addr) == usize);
    try expect(addr == 0xdeadbee0);

}

test "volatile" {
    const mmio_ptr = @intToPtr(*volatile u8, 0x12345678);
    try expect(@TypeOf(mmio_ptr) == *volatile u8);

}

test "alignment" {
    var x: i32 = 1234;
    //const align_of_i32 = @alignOf(@TypeOf(x));
    try expect(@TypeOf(&x) == *i32);
    if (builtin.target.cpu.arch == .x86_64) {
        try expect(@typeInfo(*i32).Pointer.alignment == 4);
    }

}

test "allowzero" {
    var zero: usize = 0;
    var ptr = @intToPtr(*allowzero i32, zero);
    try expect(@ptrToInt(ptr) == 0);
}

pub extern "c" fn printf(format: [*:0]const u8, ...) c_int;

pub fn main() anyerror!void {
    _ = printf("Hello Wolrd\n");
    const msg = "Hello World\n";
    const non_null_terminated_msg: [msg.len]u8 = msg.*;
    _ = printf(&non_null_terminated_msg);

}