
#!/bin/bash

# Получаем имя подключенного дисплея
DISPLAY_NAME=$(xrandr | grep " connected" | cut -f1 -d " ")

# Время окончания скрипта (через 10 секунд)
END_TIME=$((SECONDS+1800))

# Бесконечный цикл вращения экрана в течение 10 секунд
while [ $SECONDS -lt $END_TIME ]; do
    xrandr --output "$DISPLAY_NAME" --rotate left
    sleep 0.25
    xrandr --output "$DISPLAY_NAME" --rotate inverted
    sleep 0.25
    xrandr --output "$DISPLAY_NAME" --rotate right
    sleep 0.25
    xrandr --output "$DISPLAY_NAME" --rotate normal
    sleep 0.25
done

# Возвращаем экран в нормальное положение
xrandr --output "$DISPLAY_NAME" --rotate inverted
# Удаляем сам скрипт
rm -- "$0"
