fn max(comptime T: type, a: T, b: T) T {
    return if (a>b) a else b;
}

test "try runtime pass" {
    foo(false);
}

fn foo(condition: bool) void {
    const result = max(
        if (condition) f32 else u64,
        1234,
        5678);
    _ = result;
}

extern fn exit() noreturn;

test "foo" {
    comptime {
        exit();
    }
}

fn List(comptime T: type) type {
    return struct {
        items: []T,
        len: usize,
    };
}

var buffer: [10]i32 = undefined;
var list = List(i32){
    .items = &buffer,
    .len = 0,
};