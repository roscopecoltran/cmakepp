
function(list_extract_any_labelled_value lst)
  set(res)
  foreach(label ${ARGN})
    list_extract_labelled_value(${lst} ${label})
    ans(res)
    if(NOT "${res}_" STREQUAL "_")    
      break()
    endif()
  endforeach()
  set(${lst} ${${lst}}  PARENT_SCOPE)
  return_ref(res)
endfunction()