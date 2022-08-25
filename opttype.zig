const expect = @import("std").testing.expect;

test "optional" {
    var foo: ?i32 = null;
    foo = 1234;
    comptime try expect(@typeInfo(@TypeOf(foo)).Optional.child == i32);
}

test "optional poitners" {
    var ptr: ?*i32 = null;
    var x: i32 = 1;
    ptr = &x;

    try expect(ptr.?.* == 1);
    try expect(@sizeOf(?*i32) == @sizeOf(*i32));
}