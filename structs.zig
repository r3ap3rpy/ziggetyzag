const expect = @import("std").testing.expect;
const std = @import("std");

const Point = struct {
    x: f32,
    y: f32,
};

const Point2 = packed struct {
    x: f32,
    y: f32,
};

var p = Point2 {
    .x = 0.12,
    .y = 0.11,
};

const Vect = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn init(x: f32, y: f32, z: f32) Vect {
        return Vect {
            .x = x,
            .y = y,
            .z = z,
        };
    }
    pub fn dot(self: Vect, other: Vect) f32 {
        return self.x * other.x + self.y * other.y + self.z * other.z;
    }
};

test "dot product " {
    const v1 = Vect.init(1.0, 0.0, 0.0);
    const v2 = Vect.init(0.0, 1.0, 0.0);

    try expect(v1.dot(v2) == 0.0);
}

const Empty = struct {
    pub const PI = 3.14;
};

test "empty struct" {
    try expect(Empty.PI == 3.14);
}

const Fooo = struct {
    a: i32 = 1234,
    b: i32,
};

test "Default struct values" {
    const x = Fooo{
        .b = 5,
    };
    if (x.a + x.b == 1239) {
        //@compileError("It's even comptime known!");
    }
}

pub fn main() void {
    const Foo = struct {};
    std.debug.print("variable: {s}\n",.{@typeName(Foo)});
    std.debug.print("anonymus: {s}\n",.{@typeName(struct {})});
    std.debug.print("function: {s}\n",.{@typeName(List(i32))});
}

fn List(comptime T: type) type {
    return struct {
        x: T,
    };
}

test "fully anon struct" {
    try dump(.{
        .int = @as(u32, 1234),
        .float = @as(f64, 12.34),
        .b = true,
        .s = "hi",
    });

}

fn dump(args: anytype) !void {
    try expect(args.int == 1234);

}