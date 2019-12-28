// contest  : ABC 086
// task     : A
// URL      : https://atcoder.jp/contests/abc086/tasks/abc086_a
//          : https://atcoder.jp/contests/abs/tasks/abc086_a
// compiler : Rust (1.15.1)
// status   : https://atcoder.jp/contests/abc086/tasks/abc086_a : AC

// * refernce
//   * https://qiita.com/tanakh/items/0ba42c7ca36cd29d0ac8

use std::io;
use std::str;

fn main () {

    // STEP.01
    // create a new `String` instance to store the test data from standard input
    let mut buffer_stdin = String::new();

    // STEP.02
    // read a line from the standard input to get test data
    std::io::stdin().read_line(&mut buffer_stdin).unwrap();

    // STEP.03
    // split the stdin by spaces
    let mut test_data = buffer_stdin.split_whitespace();

    // STEP.04
    // read out the test data from the iterator
    let a: u32 = test_data.next().unwrap().parse().unwrap();
    let b: u32 = test_data.next().unwrap().parse().unwrap();

    println!( "{}", abc086_a(a, b) );

}

fn abc086_a (a: u32, b: u32) -> String {

    if is_even(a * b) { String::from("Even") }
    else              { String::from("Odd")  }

}

fn is_even (target: u32) -> bool {

    (target % 2) == 0

}

/* EOF */
