const D = opaque {};
const W = opaque {};

extern fn  bar(d: *D) void;
fn foo(w: *W) callconv(.C) void {
    bar(w);
}

test "call the foo" {
    foo(undefined);
}