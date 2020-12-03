#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

static int c_swap(lua_State *l)
{
	double a = luaL_checknumber(l, 1), b = luaL_checknumber(l, 2); 

	lua_pushnumber(l, b);
	lua_pushnumber(l, a);

	return 2;
}


static const struct luaL_Reg list[] = { {"lua_swap",c_swap}, {NULL, NULL} };


int luaopen_lab_10_lib(lua_State *l)
{
	luaL_newlib(l, list);
	return 1;
}
