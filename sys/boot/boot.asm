[org 0x7c00] ; Адрес загрузки в памяти

; Устанавливаем видеорежим (0x0e — текстовый 80x25)
mov ah, 0x0e
mov al, 'H' ; Выводим "H"
int 0x10

mov al, 'e' ; Выводим "e"
int 0x10

mov al, 'l' ; Выводим "l"
int 0x10

mov al, 'l' ; Выводим "l"
int 0x10

mov al, 'o' ; Выводим "o"
int 0x10

mov al, ' ' ; Выводим пробел
int 0x10

mov al, 'W' ; Выводим "W"
int 0x10

mov al, 'o' ; Выводим "o"
int 0x10

mov al, 'r' ; Выводим "r"
int 0x10

mov al, 'l' ; Выводим "l"
int 0x10

mov al, 'd' ; Выводим "d"
int 0x10

; Передаем управление ядру (kernel)
jmp 0x1000 ; Переход к kernel.c (например, в адресе 0x1000)

times 510 - ($ - $$) db 0 ; Дополняем до 510 байт
dw 0xAA55 ; Магическое число загрузчика
