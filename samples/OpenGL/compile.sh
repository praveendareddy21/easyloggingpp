## Helper script for build_all.sh

FILE=$1

macro="$macro -DELPP_THREAD_SAFE"
macro="$macro -DELPP_STL_LOGGING"
macro="$macro -DELPP_LOG_STD_ARRAY"
macro="$macro -DELPP_LOG_UNORDERED_SET"
macro="$macro -DELPP_LOG_UNORDERED_MAP"
macro="$macro -DELPP_STACKTRACE_ON_CRASH"
macro="$macro -DELPP_FEATURE_ALL"

if [ "$2" = "" ];then
  COMPILER=g++
else
  COMPILER=$2
fi

CXX_STD='-std=c++0x -pthread'

if [ "$FILE" = "" ]; then
  echo "Please provide filename to compile"
  exit
fi

echo "Compiling... [$FILE]"

COMPILE_LINE="$COMPILER $FILE -o bin/$FILE.bin $macro $CXX_STD -Wall -Wextra -lglut -lGLU -lGL -I/usr/include/x86_64-linux-gnu/c++/4.7/"

echo "    $COMPILE_LINE"

$($COMPILE_LINE)

echo "    DONE! [./bin/$FILE.bin]"
echo
echo
