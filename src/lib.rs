#![no_std]
use core::panic::PanicInfo;

extern "C" {
    fn toggle_pin13_c();
    fn toggle_pin15_c();
    fn trace_pin13_c();
    fn trace_pin15_c();
    fn delay_c();
}

fn toggle_pin13() {unsafe {toggle_pin13_c();}}
fn toggle_pin15() {unsafe {toggle_pin15_c();}}
fn trace_pin13() {unsafe {trace_pin13_c();}}
fn trace_pin15() {unsafe {trace_pin15_c();}}
fn delay() {unsafe {delay_c();}}


#[no_mangle]
pub extern fn rust_main() {
    toggle_pin13();
    toggle_pin15();
    trace_pin13();
    trace_pin15();
    delay();
}

#[panic_handler]
pub fn panic() -> ! {
	loop {}
}
