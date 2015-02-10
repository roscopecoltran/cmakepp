function(json_serialize value)

	message(WARNING "deprecated function")
	set(recursive_args)
	# indent
	if(ARGN)
		set(list_to_array)
		list(FIND args "LIST_TO_ARRAY" idx)
		if(NOT ${idx} LESS 0)
			set(list_to_array true)
			set(recursive_args LIST_TO_ARRAY)
		endif()

		set(args ${ARGN})
		list(FIND args "INDENTED" idx)
		if(NOT ${idx} LESS 0)
			json_serialize( "${value}")
			ans(json)
			json_tokenize(tokens "${json}")
			json_format_tokens(indented "${tokens}")
			return_ref(indented)
		endif()	


	endif()


	# if value is empty return an empty string
	if(NOT value)
		return()
	endif()
	# if value is a not ref return a simple string value
	ref_isvalid("${value}")
	ans(is_ref)
	if(NOT is_ref)
		json_escape( "${value}")
		ans(value)
		set(value "\"${value}\"" )
		return_ref(value)
	endif()

	# get ref type
	# here map, list and * will be differantited
	# resulting object, array and string respectively
	set(ref_type)
	ref_gettype("${value}")
	ans(ref_type)
	if("${ref_type}" STREQUAL map)
		set(res)
		map_keys(${value} )
		ans(keys)
		foreach(key ${keys})
		#	message("value '${value}' key '${key}'")
			map_get(${value} ${key})	
			ans(val)
			#message_indent_push()
			json_serialize( "${val}" ${recursive_args} )
			ans(serialized_value)
		#	message_indent_pop()
			if(serialized_value)
				set(res "${res},\"${key}\":${serialized_value}")
			endif()				
		endforeach()
		string(LENGTH "${res}" len)
		if(${len} GREATER 0)
			string(SUBSTRING "${res}" 1 -1 res)
		endif()
		
			set(res "{${res}}")
		return_ref(res)
	elseif("${ref_type}" STREQUAL list)
		ref_get( ${value} )
		ans(lst)
		set(res "")
		foreach(val ${lst})
			json_serialize( "${val}" ${recursive_args})			
			ans(serialized_value)
			set(res "${res},${serialized_value}")				
		endforeach()	

		string(LENGTH "${res}" len)
		if(${len} GREATER 0)				
			string(SUBSTRING "${res}" 1 -1  res)
		endif()
		set(res "[${res}]")
		return_ref(res)
	else()			
		ref_get( ${value} )
		ans(ref_value)
		if(list_to_array)
			list_new()
			ans(lst)
			ref_set(${lst} "${ref_value}")
			json_serialize( "${lst}" ${recursive_args})
			ans(serialized_value)
			return_ref(serialized_value)
		endif()

		json_escape( "${ref_value}")
		ans(ref_value)

		return_ref(ref_value)

	endif()
endfunction()