


function(map_remove this key)
	#map_check(${this})
	map_keys(${this} keys)
	if(NOT keys)
		return()
	endif()
	list(FIND keys "${key}" res)
	if(${res} LESS 0)
		return()
	endif()

	list(REMOVE_AT keys ${res})
	set_property(GLOBAL PROPERTY ${this} ${keys})
endfunction()