// contest  : ABC 086
// task     : A
// URL      : https://atcoder.jp/contests/abc081/tasks/abc081_a
//          : https://atcoder.jp/contests/abs/tasks/abc081_a
// compiler : Rust (1.15.1)
// status   : Not Submitted

// * refernce
//   * https://qiita.com/tanakh/items/0ba42c7ca36cd29d0ac8

extern crate num_integer;

use std::io;
use std::str;
use num_integer::Integer;

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

    if (a * b).is_even() { String::from("Even") }
    else                 { String::from("Odd")  }

}

// https://atcoder.jp/contests/abc086/custom_test

// error[E0463]: can't find crate for `num_integer`
//   --> ./Main.rs:11:1
//    |
// 11 | extern crate num_integer;
//    | ^^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
// 
// error: aborting due to previous error
// 
// 

/* EOF */
