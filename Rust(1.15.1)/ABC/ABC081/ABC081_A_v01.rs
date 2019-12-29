// contest  : ABC 081
// task     : A
// URL      : https://atcoder.jp/contests/abc081/tasks/abc081_a
//          : https://atcoder.jp/contests/abs/tasks/abc081_a
// compiler : Rust (1.15.1)
// status   : https://atcoder.jp/contests/abc081/submissions/9196593 : AC

// * reference
//   * https://qiita.com/tubo28/items/e6076e9040da57368845

use std::io::*;
use std::str;

fn main () {
    let test_data: u8 = read();

    println!( "{}", abc081_a(test_data) );
}

fn abc081_a (test_data: u8) -> u8 {

    let mut iter:        u8 = test_data;
    let mut num_marbles: u8 = 0;

    while iter > 0 {
        num_marbles += iter % 10;
        iter        /= 10;
    }

    /* return value of this function */
    num_marbles

}

// * reference
fn read<T: std::str::FromStr>() -> T {

    let stdin = std::io::stdin();

    let handle = stdin.lock();

    let token: String = handle
        .bytes()
        .map(|c| c.expect("failed to read char") as char)
        .skip_while(|c|  c.is_whitespace())
        .take_while(|c| !c.is_whitespace())
        .collect();

    token.parse().ok().expect("failed to parse token")

}

/* EOF */
