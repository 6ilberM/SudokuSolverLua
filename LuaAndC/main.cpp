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

	lua_getglobal(L, "message",);
	lua_pushstring(L, "8, 0, 0, 4, 0, 6, 0, 0, 7");
	lua_pushnumber(L, 1);
	lua_pcall(L, 2,0, 0);
	
	lua_getglobal(L, "message");
	lua_pushstring(L, "0, 0, 0, 0, 0, 0, 4, 0, 0");
	lua_pushnumber(L, 2);
	lua_pcall(L, 2, 0, 0);

	lua_getglobal(L, "message");
	lua_pushstring(L, "0, 1, 0, 0, 0, 0, 6, 5, 0");
	lua_pushnumber(L, 3);
	lua_pcall(L, 2, 0, 0);

	lua_getglobal(L, "message");
	lua_pushstring(L, "5, 0, 9, 0, 3, 0, 7, 8, 0");
	lua_pushnumber(L, 4);
	lua_pcall(L, 2, 0, 0);

	lua_getglobal(L, "message");
	lua_pushstring(L, "0, 0, 0, 0, 7, 0, 0, 0, 0");
	lua_pushnumber(L, 5);
	lua_pcall(L, 2, 0, 0);

	lua_getglobal(L, "message");
	lua_pushstring(L, "0, 4, 8, 0, 2, 0, 1, 0, 3");
	lua_pushnumber(L, 6);
	lua_pcall(L, 2, 0, 0);

	lua_getglobal(L, "message");
	lua_pushstring(L, "0, 5, 2, 0, 0, 0, 0, 9, 0");
	lua_pushnumber(L, 7);
	lua_pcall(L, 2, 0, 0);

	lua_getglobal(L, "message");
	lua_pushstring(L, "0, 0, 1, 0, 0, 0, 0, 0, 0");
	lua_pushnumber(L, 8);
	lua_pcall(L, 2, 0, 0);

	lua_getglobal(L, "message");
	lua_pushstring(L, "3, 0, 0, 9, 0, 2, 0, 0, 5");
	lua_pushnumber(L, 9);
	lua_pcall(L, 2, 0, 0);


	lua_getglobal(L, "Init");
	lua_pcall(L, 0, 0, 0);

	int itemp;
	cin>> itemp;


	lua_close(L);
	return 0;
}