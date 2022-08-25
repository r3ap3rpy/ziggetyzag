const expect = @import("std").testing.expect;

test "simple if " {
    const a: i32 = 10;
    const b: i32 = 20;
    const result = if (a > b) 46 else 100;
    try expect(result == 100);
}

test "boolean" {
    const a: i32 = 5;
    const b: i32 = 4;
    if (a != b) {
        try expect(true);
    } else if (a == 5) {
        unreachable;
    } else {
        unreachable;
    }
}

test "error union with optionals" {
    const  a: anyerror!?u32 = 0;
    if (a) |optional_value| {
        try expect(optional_value.? == 0);
    }  else |err| {
        _ = err;
        unreachable;
    }

}