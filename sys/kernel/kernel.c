void main() {
    char* video_memory = (char*) 0xB8000;  // Адрес видеопамяти в текстовом режиме
    const char* message = "Hello from Kernel!";
    
    // Выводим сообщение на экран
    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];        // Пишем символ
        video_memory[i * 2 + 1] = 0x07;         // Цвет (0x07 — стандартный белый текст на черном фоне)
    }
    
    while (1) {
        // Бесконечный цикл, чтобы ядро не завершилось
    }
}
