const std = @import("std");
const expect = std.testing.expect;

const Payload = union {
    int: i64,
    float: f64,
    boolean: bool,
};

test "simple test" {
    var payload = Payload{.int = 1234};
    try expect(payload.int == 1234);
    payload = Payload{.float = 12.34};
    try expect(payload.float == 12.34);
}

const ComplexTypeTag = enum {
    ok,
    not_ok,
};
const ComplexType = union(ComplexTypeTag){
    ok: u8,
    not_ok: void,
};

test "switch union" {
    const c = ComplexType{.ok = 42};
    try expect(@as(ComplexTypeTag, c) == ComplexType.ok);
    switch (c) {
        ComplexTypeTag.ok => |value| try expect(value == 42),
        ComplexTypeTag.not_ok => unreachable,
    }
}

const Number = union {
    int: i32,
    float: f64,
};

test "anon union literal" {
    var i: Number = .{.int = 42};
    var f = makeNumber();
    try expect(i.int == 42);
    try expect(f.float == 12.34);
}

fn makeNumber() Number {
    return .{.float = 12.34};
}