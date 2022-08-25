const std = @import("std");
const builtin = @import("builtin");
const native_arch = builtin.cpu.arch;
const expect = std.testing.expect;

fn add(a: i8, b: i8) i8 {
    if (a==0){
        return b;
    }
    return a + b;
}

export fn sub(a: i8, b: i8) i8 {return a - b; }

const WINAPI: std.builtin.CallingConvention = if (native_arch == .i386) .Stdcall else .C;
extern "kernel32" fn ExitProcess(exit_code: u32) callconv(WINAPI) noreturn;
extern "c" fn atan2(a: f64, b: f64) f64;

fn abort() noreturn {
    @setCold(true);
    while (true) {}
}

fn _start() callconv(.Naked) noreturn {
    abort();
}

fn shiftLeftOne(a: u32) callconv(.Inline) u32 {
    return a << 1;
}

pub fn sub2(a: i8, b: i8) i8 { return a - b; }

const call2_op = fn (a: i8, b: i8) i8;

fn do_op(fn_call: call2_op, op1: i8, op2: i8) i8 {
    return fn_call(op1, op2);
}

test "function" {
    try expect(do_op(add,5,6) == 11);
    try expect(do_op(sub2,5,6) == -1);
}

const Point = struct {
    x: i32,
    y: i32,
};

fn foo(point: Point) i32 {
    return point.x + point.y;
}

test "pass struct to function" {
    try expect(foo(Point{.x = 1, .y = 2}) == 3);
}

fn addFortyTwo(x: anytype) @TypeOf(x) {
    return x + 42;
}

test "fn type inference" {
    try expect(addFortyTwo(1) == 43);
}

test "reflection" {
    try expect(@typeInfo(@TypeOf(expect)).Fn.args[0].arg_type.? == bool);
}