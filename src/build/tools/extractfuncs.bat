cd ..\game
..\build\tools\extractfuncs *.c -o g_func_list.h g_func_decs.h
..\build\tools\extractfuncs *.c -t mmove_t -o g_mmove_list.h g_mmove_decs.h
cd ..
