# ITMO.cLAB Rust

## Авторы
+ Степанов Михаил **[timetocook420@gmail.com]**
+ Андрейченко Леонид
+ Казаченко Роман
+ Колесникова Светлана

## Описание

Шаблон проекта STM32CubeIDE на языке Rust для SDK-1.1M для загрузки в [ITMO.cLAB](https://sdk.ifmo.ru)

### Необходимый инструментарий для разработки

Инструкция по установке:
+ обновляем пакеты `sudo apt update`
+ make `sudo apt-get install build-essential`
+ cargo `curl https://sh.rustup.rs -sSf | sh`
+ arm eabi tools ` sudo apt install gcc-arm-none-eabi `


## Использование
### Написание кода

Код на языке Rust следует писать в файле [lib.rs](src/lib.rs).
Также возможно написание кода в других файлах, но следует учесть, 
что в таком случае они должны быть включены в lib.rs или добавлены в сборку проекта вручную.

Основной код должен быть помещен в функцию rust_main.

### Сборка проекта
```shell
make all
```

### Очистка проекта
```shell
make clean
```
 
