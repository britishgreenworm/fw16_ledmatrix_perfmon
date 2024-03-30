#dim screens
./ledmat_cli led-matrix --brightness 3

while true; do
    # Get memory usage as a percentage
    memory_percent=$(free | grep Mem | awk '{printf "%.0f\n", ($3/$2) * 100}')
    cpu_percent=$(top -bn1 | grep '%Cpu' | awk '{print $2 + $4 + $6 + $10}' | awk -F. '{print $1}')

    ./ledmat_cli --serial-dev /dev/ttyACM0 led-matrix --percentage $memory_percent
    ./ledmat_cli --serial-dev /dev/ttyACM1 led-matrix --percentage $cpu_percent

    sleep 1
done
