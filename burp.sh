#!/bin/bash

# Check if an argument is provided
if [ $# -eq 1 ]; then
    user_input=$1
elif [ $# -eq 2 ]; then
    user_input=$1
else
    # If no argument is provided, ask the user for input
    read -p "Enter 1 For Only Burp And Enter 2 For Burp With Firefox: " user_input
fi
# Check if the argument is "burp" or "-b"
if [ "$user_input" == "1" ]; then
    # Command to execute when the argument is "burp" or "-b"
    custom_command= /usr/lib/jvm/java-17-openjdk-amd64/bin/java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:/home/aghora/Burp/Loader.jar -noverify -jar /home/aghora/Burp/burpsuite_pro_v2023.6.2.jar >/dev/null 2>&1 & echo "Execution Completed: Only Burpsuite Started"
    eval "$custom_command"
elif [ "$user_input" == "2" ]; then
    # Execute the user input for option 2
    eval /usr/lib/jvm/java-17-openjdk-amd64/bin/java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:/home/aghora/Burp/Loader.jar -noverify -jar /home/aghora/Burp/burpsuite_pro_v2023.6.2.jar >/dev/null 2>&1 & firefox > /dev/null 2>&1 & echo "Execution Completed: Burpsuite With Firefox Started"
else
    echo "Wrong Input Retry...."
fi
