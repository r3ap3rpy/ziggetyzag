const expect = @import("std").testing.expect;
const mem = @import("std").mem;
const std = @import("std");

const Type = enum {
    ok,
    not_ok,
};

const c = Type.ok;

const Value = enum(u2) {
    zero,
    one,
    two,
};

test "enum ordinal" {
    try expect(@enumToInt(Value.zero) == 0);
    try expect(@enumToInt(Value.one) == 1);
}

const Value2 = enum(u32) {
    hundred = 100,
    thousand = 1000,
    million = 1000000,
};

test "enum ordinal overrride" {
    try expect(@enumToInt(Value2.hundred) == 100);
    try expect(@enumToInt(Value2.million) == 1000000);
}

const Foo = enum(c_int) {a, b, c};
export fn entry(foo: Foo) void { _ = foo; }

const Color = enum {
    auto,
    on,
    off,
};

test "enum literals" {
    const c1: Color = .auto;
    const c2 = Color.auto;
    try expect(c1 == c2);
}

const Number =  enum(u8) {
    one,
    two,
    three,
    _,
};

test "switch test enum" {
    const n = Number.one;
    const r = switch (n) {
        .one => true,
        .two,
        .three => false,
        _ => false,
    };
    try expect(r);
    const is_one = switch (n) {
        .one => true,
        else => false,
    };
    try expect(is_one);

}