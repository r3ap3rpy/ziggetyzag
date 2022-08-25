const expect = @import("std").testing.expect;

test "while basic" {
    var i: usize = 0;
    while (i<10) {
        i += 1;
    }
    try expect(i == 10);
}

test "while basic" {
    var i: usize = 0;
    while (i<10) {
        i += 1;
        if (i == 5) 
            break;
    }
    try expect(i == 5);
}

test "while loop continue" {
    var i: usize = 0;
    while (i<10) : (i += 1) {}
    try expect(i == 10);
}

test "while loop continue complex" {
    var i: usize = 1;
    var j: usize = 1;
    while (i*j < 200) : ({i *= 2; j *= 3;}) {
        const my_ij = i*j;
        try expect(my_ij < 2000);    
    }
}

test "nested break" {
    outer: while (true) {
        while (true) {
            break :outer;
        }
    }
}

test "nested continue" {
    var i: usize = 0;
    outer: while (i<10) : (i += 1) {
        while (true) {
            continue :outer;
        }
    }
}