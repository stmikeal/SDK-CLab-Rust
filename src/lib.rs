#![crate_type = "staticlib"]
extern crate core;
use core::ffi::c_int;

extern "C" {
    fn toggle_pin13_c();
    fn toggle_pin15_c();
    fn trace_pin13_c();
    fn trace_pin15_c();
    fn delay_c(time: c_int);
}

fn toggle_pin13() {unsafe {toggle_pin13_c();}}
fn toggle_pin15() {unsafe {toggle_pin15_c();}}
fn trace_pin13() {unsafe {trace_pin13_c();}}
fn trace_pin15() {unsafe {trace_pin15_c();}}
fn delay(time: c_int) {unsafe {delay_c(time);}}


#[no_mangle]
pub extern fn rust_main() {
    toggle_pin13();
    toggle_pin15();
    trace_pin13();
    trace_pin15();
    delay(250);
}
