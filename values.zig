const print = std.debug.print;
const std = @import("std");
const os = std.os;
const assert = std.debug.assert;
const mem = @import("std").mem;

pub fn main() void {
    const one_plus_one: i32 = 1 + 1;
    print("1 + 1 = {}\n",.{one_plus_one});

    const seven_div_three: f32 = 7 / 3;
    print("7 / 3 = {}\n",.{seven_div_three});

    print("{}\n{}\n{}\n", .{
        true and false,
        true or false,
        !true,
    });

    var optional_value: ?[]const u8 = null;
    assert(optional_value == null);

    var number_or_error: anyerror!i32 = error.ArgNotFound;

    print("\nerror union 1\ntype: {s}\nvalue: {any}\n", .{
        @typeName(@TypeOf(number_or_error)),
        number_or_error,
    });

    const bytes = "hello";
    print("{s}\n", .{@typeName(@TypeOf(bytes))});
    print("{d}\n", .{bytes.len});
    print("{c}\n", .{bytes[1]});

    var x: i32 = undefined;
    x = 1;
    print("{d}\n",.{x});
}