SENSORS=/usr/bin/sensors
let count=0
sum=0.0
for temp in $($SENSORS | grep "^Core" | grep -e '+.*C' | cut -f 2 -d '+' | cut -f 1 -d ' ' | sed 's/°C//'); do
    sum=$(echo $sum+$temp | bc)
    let count+=1
done
temp=$(echo "$sum/$count" | bc)
echo $temp
