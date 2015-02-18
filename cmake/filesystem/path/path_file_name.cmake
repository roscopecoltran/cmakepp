# returns the name of the file without the directory
# if -we is specified the extensions is dropped
function(path_file_name path)
  set(args ${ARGN})
  list_extract_flag(args -we)
  ans(without_extension)
  if(without_extension)
    set(cmd NAME_WE)
  else()
    set(cmd NAME)
  endif() 
  path("${path}")
  ans(path)
  get_filename_component(res "${path}" ${cmd})
  return_ref(res)
endfunction()