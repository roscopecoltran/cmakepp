function(obj_getbyid result id)
	if(EXISTS "${id}")
		return_value("${id}")
	elseif(EXISTS "${cutil_data_dir}/objects/${id}")
		return_value("${cutil_data_dir}/objects/${id}")
	else()
		return_value(NOTFOUND)
	endif()
endfunction()