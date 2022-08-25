const std = @import("std");
const expect = std.testing.expect;
const mem = std.mem;
const fmt = std.fmt;

test "String slices" {
    const hello: []const u8 = "hello";
    const world: []const u8 = "世界";

    var all_together: [100]u8 = undefined;

    const all_together_slice = all_together[0..];
    const hello_world = try fmt.bufPrint(all_together_slice,"{s} {s}", .{hello, world});
    try expect(mem.eql(u8,hello_world,"hello 世界"));
}

test "null terminated" {
    const slice: [:0]const u8 = "hello";
    try expect(slice.len == 5);
    try expect(slice[5] == 0);

}