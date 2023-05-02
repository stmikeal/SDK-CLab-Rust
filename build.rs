extern crate cc;

use std::process::Command;

fn main() {
    Command::new("gcc")
        .arg("-o")
        .arg("func")
        .arg("-ICore/Inc")
        .arg("-IDrivers/STM32F4xx_HAL_Driver/Inc")
        .arg("-IDrivers/CMSIS/Include")
        .arg("-IDrivers/CMSIS/Device/ST/STM32F4xx/Include")
        .arg("$(find Core/Src/*.c)")
        .arg("$(find Drivers/STM32F4xx_HAL_Driver/Src/*.c)")
        .output()
        .expect("failed to execute process");

}
