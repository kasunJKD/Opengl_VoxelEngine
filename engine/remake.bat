@echo off

if exist build\\CMakeCache.txt (
	del /F build\\CMakeCache.txt
)

cmake -S . -B build -GNinja