// contest  : ABC 147
// task     : A
// URL      : https://atcoder.jp/contests/abc147/tasks/abc147_a
// compiler : Rust (1.15.1)
// status   : https://atcoder.jp/contests/abc147/submissions/9192914 : AC

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
    let a1: u8 = test_data.next().unwrap().parse().unwrap();
    let a2: u8 = test_data.next().unwrap().parse().unwrap();
    let a3: u8 = test_data.next().unwrap().parse().unwrap();

    println!( "{}", abc147_a_answerer(a1, a2, a3) );

}

fn abc147_a_answerer (a1: u8, a2: u8, a3: u8) -> String {

    return
        if   abc147_a_judge (a1, a2, a3) { String::from("win")  }
        else                             { String::from("bust") }

}

fn abc147_a_judge (a1: u8, a2: u8, a3: u8) -> bool {

    return a1 + a2 + a3 <= 21

}

/* EOF */
