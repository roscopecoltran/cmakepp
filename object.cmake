
export_function(obj_create)
export_function(obj_getbyid)
export_function(obj_getall)
export_function(obj_nullcheck)
export_function(obj_exists)
export_function(obj_delete)
export_function(obj_hasownproperty)
export_function(obj_getownref)
export_function(obj_getref)
export_function(obj_getrefvalue)
export_function(obj_getownproperty)
export_function(obj_setownproperty)
export_function(obj_getprototype)
export_function(obj_setprototype)
export_function(obj_get)
export_function(obj_has)
export_function(obj_set)
export_function(obj_settype)
export_function(obj_gettype)
export_function(obj_istype)
export_function(obj_typecheck)
export_function(obj_bindcall)
export_function(obj_callmember)
export_function(map_create)
export_function(map_delete)
export_function(map_getkeys)
export_function(map_get)
export_function(map_set)


import(object)
obj_getbyid(string_class "Object")
if(NOT string_class)
	obj_create(string_class "Object")
	obj_settype(${string_class} "Object")


endif()