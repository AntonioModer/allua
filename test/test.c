#include "al_lua.h"
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	lua_State* state = lua_open();
	luaL_openlibs(state);
	al_lua_register(state);
	if(argc<2)
	{
		printf("Please gimme a lua script to run!\n");
	}
	else
	{
		printf("Running %s\n", argv[1]);
		int r = luaL_dofile (state, argv[1]);
	}
}