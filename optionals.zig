const optional_int: ?i32 = 1234;

extern fn malloc(size: size_t) ?*u8;

fn doAThing() ?*Foo {
    const ptr = malloc(1234) orelse return null;
    _ = ptr;
}

const Foo struct {};

fn doSomethingWithFoo(foo: *Foo) void { _ = foo; }

fn doAthingWithFoo(optional_foo: ?*Foo) void {
    if (optional_foo) |foo| {
        doSomethingWithFoo(foo);
    } 
    // do other stuff aswell.
}