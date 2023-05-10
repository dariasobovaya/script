#!/bin/bash

# Получение названий файлов ввода и вывода.
read -p "Введите название файла входных данных: " krutoifile
read -p "Введите название файла вывода: " pochtikrutoifile

# 2 проверки существуют ли файлы.
if [ ! -f "$krutoifile" ]; then
    echo "Входного файла нет."
    exit 1
fi

if [ ! -f "$pochtikrutoifile" ]; then
    echo "Файла вывода нет."
    exit 1
fi

# Запрос слова.
read -p "Введите слово: " slovo

# Сам основной подсчет количества строк, содержащих слово, в файле ввода.
count=0
while read line; do
    # Проверяем, содержит ли текущая строка слово
    if echo "$line" | grep -qi "$slovo"; then
        count=$((count + 1))
    fi
done < "$krutoifile"

# Записываем результат в выходной файл
if [ $count -eq 0 ]; then
    echo "Искомое слово не найдено в файле"
else
    echo "Количество строк, содержащих \"$slovo\" в файле: $count" >> "$pochtikrutoifile"
fi

echo "Готово."