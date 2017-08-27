extern "C" {
#include<lua.h>
#include<lualib.h>
#include <lauxlib.h>
}
#include<iostream>

using namespace std;

#pragma region Functions


//int main()
//{
//	lua_State *L = luaL_newstate();
//	luaL_openlibs(L);
//	luaL_dofile(L, "luaVar.lua");
//	lua_getglobal(L, "x");
//	lua_getglobal(L, "y");
//	lua_getglobal(L, "z");
//	cout << lua_tonumber(L,-3)<<endl;
//	cout << lua_tostring(L, -2) << endl;
//	cout << lua_toboolean(L, -1) << endl;
//	lua_close(L);
//	int itemp;
//	cin >> itemp;
//	return (0);
//}


//int main()
//{
//	lua_State *L = luaL_newstate();
//	luaL_openlibs(L);
//	luaL_dofile(L, "luaFunc.lua");
//	lua_getglobal(L, "message");
//	lua_pushstring(L, "hello from Lua");
//	lua_pushnumber(L, 5);
//	lua_pcall(L, 2, 0, 0);
//
//	//lua_pcall(L, 2, 2, 0); //two return values
//	cout << lua_tonumber(L, -2) << endl<< lua_tonumber(L,-1);
//
//	lua_close(L);
//	int itemp;
//	cin >> itemp;
//	return (0);
//}


//int main()
//{
//	lua_State *L = luaL_newstate();
//	luaL_openlibs(L);
//	luaL_dofile(L, "luaFunc.lua");
//	lua_getglobal(L, "message");
//	lua_pushstring(L, "hello from Lua");
//	lua_pushnumber(L, 5);
//	//lua_pcall(L, 2, 0, 0);
//
//	lua_pcall(L, 2, 2, 0); //two return values
//	cout << lua_tonumber(L, -2) << endl << lua_tonumber(L, -1);
//
//	lua_close(L);
//	int itemp;
//	cin >> itemp;
//	return (0);
//}

//int addition(lua_State *L);
//int main()
//{
//	lua_State *L = luaL_newstate();
//	luaL_openlibs(L);
//	
//	lua_pushcfunction(L, addition);
//	lua_setglobal(L, "add");
//
//	luaL_dofile(L, "addFile.lua");
//
//	//lua_getglobal(L, "x");
//	//cout << lua_tonumber(L, -1)<<endl;
//
//
//
//	lua_close(L);
//
//
//	int itemp;
//	cin >> itemp;
//	return (0);
//}
//int addition(lua_State *L)
//{
//	double m = lua_tonumber(L, 1);
//	double n = lua_tonumber(L, 2);
//	lua_pushnumber(L, m + n);
//	return 1;
//}

/*
int main()
{
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);

	luaL_dofile(L, "cTable.lua");
	lua_getglobal(L, "printCtable");
	int data[] = { 10,20,30 };
	lua_newtable(L);
	for (int i = 0; i < 3; i++)
	{
		lua_pushnumber(L, i + 1);
		lua_pushnumber(L, data[i]);
		lua_settable(L, -3);
	}
	if (lua_pcall(L, 1, 0, 0) != EXIT_SUCCESS)
	{
		cout << "error running function print msg" << endl;
		lua_close(L);
	}
	lua_close(L);


	int itemp;
	cin >> itemp;
	return (0);
}
*/
#pragma endregion
int main()
{
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	luaL_dofile(L, "hello.lua");
	lua_close(L);
	return 0;
}