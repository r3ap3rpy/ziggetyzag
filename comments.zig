/// This is a doc comment!
const print = @import("std").debug.print;

const  Timestamp = struct {
    /// The number of seconds!
    seconds: i64,
    /// This is another doc comment!
    nanos: u32,
    pub fn unixEpoch() Timestamp {
        return Timestamp{
            .seconds = 0,
            .nanos = 0,
        };

    }
};

pub fn main() void {
    print("Hello World!\n", .{}); // antoher comment
}