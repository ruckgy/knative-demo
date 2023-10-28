if [ "$1" == "jvm" ]; then
    echo "Running App in JVM mode"
    CMD="java -jar exec/demo-0.0.1-SNAPSHOT.jar"
elif [ "$1" == "native" ]; then
    echo "Running App in Native mode"
    CMD="./exec/demo"
elif [ "$1" == "native-pgo" ]; then
    echo "Running App in Native mode with Profile Guided Optimisation"
    CMD="./exec/demo-pgo"
fi
