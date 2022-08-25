const std = @import("std");
const builtin = @import("builtin");
const expect = std.testing.expect;

test "Lets add one to twenty!" {
    try std.testing.expect(addOne(20) == 21);
}

test "Mulitply by 3" {
    try std.testing.expect(multByThree(10) == 30);
}

test "Expected failure" {
    try std.testing.expect(true);    
}
test "Skipp this one!" {
    return error.SkipZigTest;
}

//test "Detect memory leak" {
//    var list = std.ArrayList(u21).init(std.testing.allocator);
//    try list.append('☔');
//    try std.testing.expect(list.items.len == 1);
//}

test "builtin.is_test" {
    try expect(isATest());
}

test "expectEqual demo" {
    const expected: i32 = 42;
    const actual = 42;
    try std.testing.expectEqual(expected,actual);
}

test "expectError demo" {
    const expected_error = error.DemoError;
    const actual_error_union: anyerror!void = error.DemoError;
    try std.testing.expectError(expected_error,actual_error_union);
}

fn addOne(number: i32) i32 {
    return number + 1;
}

fn multByThree(number: i32) i32 {
    return number * 3;
}

fn isATest() bool {
    return builtin.is_test;
}
