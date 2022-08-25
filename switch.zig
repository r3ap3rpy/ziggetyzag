const std = @import("std");
const builtin = @import("builtin");
const expect = std.testing.expect;

test "simple" {
    const a: u64 = 10;
    const zz: u64 = 103;

    const b = switch (a) {
        1,2,3 => 0,
        5...100 => 1,
        101 => blk: {
            const c: u64 = 5;
            break :blk c * 2 + 1;
        },
        zz => zz,
        blk: {
            const d: u32 = 5;
            const e: u32 = 100;
            break :blk d + e;
        } => 107,
        else => 9,
    };
    try expect(b == 1);
}
const on_msg = switch (builtin.os.tag) {
    .linux => "we found  a linux user",
    else => "not a linux user",
};
test "switch in function" {
    switch (builtin.os.tag) {
        .fuchsia => {
            @compileError("Fuchisa is not supported");
        },
        else => {},
    }
}

const Color = enum {
    auto,
    on,
    off,
};

test "exhaustive switching" {
    const color = Color.off;
    switch (color) {
        Color.auto => {},
        Color.on => {},
        Color.off => {},
    }
}

test "enum literals" {
    const color = Color.off;
    const result = switch (color) {
        .on =>false,
        .auto => false,
        .off => true,
    };
    try expect(result);
}