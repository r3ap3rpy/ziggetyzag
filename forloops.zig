const expect = @import("std").testing.expect;
const std = @import("std");

test "basic test" {
    const items = [_]i32 {1,2,3,4,5};
    var sum: i32 = 0;
    for (items) |value| {
        if (value == 0) {
            continue;
        }
        sum += value;
    }
    try expect(sum == 15);
}

test "reference" {
    var items = [_]i32 {1,2,3,4,5};
    for (items) |*value| {
        value.* += 1;
    }
    try expect(items[0] == 2);
    try expect(items[1] == 3);
}

test "nested loop" {
    var count: usize = 0;
    outer: for ([_]i32{1,2,3,4,5,6,7,8}) |_| {
        for ([_]i32{1,2,3,4,5}) |_| {
            count += 1;
            continue :outer;
        }
    }
    try expect(count == 8);
}