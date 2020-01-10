# FIRST: Edit that config line to specify a GCC/G++-based cross compiler installed on your PC.
# It is also recommended to change your compile options.

config_cross_compiler="i386-elf-g++" # gcc = C, g++ = C++
config_c_flags="kernel.cpp boot.o -o kernel.bin -nostdlib -ffreestanding -std=c++11 -mno-red-zone -fno-exceptions -nostdlib -fno-rtti -Wall -Wextra -Werror -T linker.ld" # Always enabled non-optimization flags (e.g. Werror)
config_c_optimization="-march=native -O2 -pipe"
config_cpp_flags="${config_c_flags}"
config_cpp_optimization="${config_c_optimization}"
config_optimization_enabled=0 # 0 = False, 1 = True

read -p '1 for compile, 2 for quit' chosen

if [ $chosen -eq 1 ]
then
      nasm -f elf32 boot.asm -o boot.o
      if [ $config_optimization_enabled -eq 0 ]
      then
            eval $config_cross_compiler $config_c_flags
      elif [ $config_optimization_enabled -eq 1 ]
      then
            eval $config_cross_compiler $config_c_flags $config_c_optimization
      else
            echo "Optimization is at unknown state. Error code 2."
            exit 2
      fi
elif [ $chosen -eq 2 ]
then
      clear
      exit 1
else
      echo "Please use numbers 1 or 2. Error code 3."
      exit 3
fi
