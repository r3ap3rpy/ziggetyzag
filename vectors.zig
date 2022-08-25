const std = @import("std");
const expectEqual = std.testing.expectEqual;

test "Basic vector" {
    const a = @Vector(4, i32) {1,2,3,4};
    const b = @Vector(4, i32) {5,6,7,8};
    const c = a + b;
    try expectEqual(6,c[0]);
    try expectEqual(8,c[1]);
    try expectEqual(10,c[2]);
}

test "Conversion" {
    var arr1: [4]f32 = [_]f32{1.1,2.2,3.3,4.4};
    var vec: @Vector(4,f32) = arr1;
    var arr2: [4]f32 = vec;

    try expectEqual(arr1,arr2);
    const vec2: @Vector(2, f32) = arr1[1..3].*;
    var slice: []const f32 = &arr1;
    var offset: u32 = 1;

    const vec3: @Vector(2, f32) = slice[offset..][0..2].*;
    try expectEqual(slice[offset], vec2[0]);
    try expectEqual(slice[offset + 1], vec2[1]);
    try expectEqual(vec2, vec3);
 }