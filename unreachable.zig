const assert = @import("std").debug.assert;

test "basic math" {
    const x = 1;
    const y = 2;
    if (x+y != 3) {
        unreachable;
    }
}

//fn assert(ok: bool) void {
//    if (!ok) unreachable;
//}

test "this will fail!" {
    assert(true);
}

test "type of unrachable" {
    comptime {
        assert(@TypeOf(unreachable) == noreturn);
    }
}