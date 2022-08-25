const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

fn deferExample() !usize {
    var a: usize = 1;
    {
        defer a = 2;
        a = 1;
    }
    try expect(a == 2);
    a = 5;
    return a;
}

test "defer basics" {
    try expect((try deferExample()) == 5);
}

fn deferUnwindExample() void {
    print("\n", .{});

    defer {
        print("1 ", .{});
    }
    defer {
        print("2 ", .{});
    }
    if (false) {
        defer {
            print("3 ", .{});
        }
    }
} 

test "defer unwind" {
    deferUnwindExample();
}

fn deferErrorExample(is_error: bool) !void {
    print("\nThe start of function!\n", .{});
    defer {
        print("end of function\n",.{});
    }
    errdefer {
        print("encountered an error\n",.{});
    }
    if(is_error) {
        return error.DeferError;
    }
}

test "defererror" {
    deferErrorExample(false) catch {};
    deferErrorExample(true) catch {};
}