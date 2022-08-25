const std = @import("std");
const expect = @import("std").testing.expect;
const assert = @import("std").debug.assert;
const mem = @import("std").mem;

const message = [_]u8{'h','e','l','l','o'};

comptime {
    assert(message.len == 5);
}

const same_message = "hello";

comptime {
    assert(mem.eql(u8,&message,same_message));
}

var some_integers: [100]i32 = undefined;

test "array iteration" {
    for (some_integers) |*item, i|{
        item.* = @intCast(i32,i);
    }
    try expect(some_integers[10] == 10);
    try expect(some_integers[70] == 70);
}

const part_one = [_]i32{1,2,3,4,5};
const part_two = [_]i32{6,7,8,9,10};
const all = part_one ++ part_two;
comptime {
    assert(mem.eql(i32,&all,&[_]i32{1,2,3,4,5,6,7,8,9,10}));
}

const pattern = "ab" ** 3;
comptime {
    assert(mem.eql(u8,pattern,"ababab"));
}

test "anon list literal syntax" {
    var array: [4]u8 = .{11,22,33,44};
    try expect(array[0] == 11);
    try expect(array[1] == 22);
    try expect(array[2] == 33);
    try expect(array[3] == 44);
}

test "fully anon list literal" {
    try dump(.{@as(u32,1234),@as(f64,12.34),true, "hi"});
}

fn dump(args: anytype) !void {
    try expect(args.@"0" == 1234);
    try expect(args.@"1" == 12.34);
    try expect(args.@"2");
}

test "null terminated" {
    const array = [_:0]u8 {1,2,3,4};
    try  expect(@TypeOf(array) == [4:0]u8);
    try expect(array.len == 4);
    try expect(array[4] == 0);

}

const mat2x2 = [2][2]f32{
    [_]f32{1.0,0.0},
    [_]f32{0.0,1.0},
};

test "multi dimensional array" {
    try expect(mat2x2[1][1] == 1.0);

}