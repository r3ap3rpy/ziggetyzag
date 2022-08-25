const std = @import("std");
const expect = std.testing.expect;

test "blocking " {
    {
        var x: i32 = 1;
        x += 1;
        _ = x;
    }    
}

test "labeled" {
    var y: i32 = 123;
    const x = blk: {
        y += 1;
        break :blk y;
    };
    try expect(x == 124);
    try expect(y == 124);
}