const std = @import("std");
const expect = std.testing.expect;

export fn entry() void {
    var x: void = {};
    var y: void = {};
    x = y;
}

test "turn hashmap to set with void" {
    var map = std.AutoHashMap(i32,void).init(std.testing.allocator);
    defer map.deinit();

    try map.put(1,{});
    try map.put(2,{});

    try expect(map.contains(2));    
    try expect(!map.contains(3));
}

test "pointer to empty struct" {
    const Empty = struct {};
    var a = Empty{};
    var b = Empty{};
    var ptr_a = &a;
    var ptr_b = &b;
    comptime try expect(ptr_a == ptr_b);
}