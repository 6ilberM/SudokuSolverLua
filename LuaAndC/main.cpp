extern "C" {
#include<lua.h>
#include<lualib.h>
#include <lauxlib.h>
}

#include<iostream>
#include<string>

using namespace std;


int main()
{
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	luaL_dofile(L, "sudoku.lua");
	lua_close(L);
	return 0;
}