# Exports the curretn scope of local variables into a map
function(scope_export_map)
  get_cmake_property(_variableNames VARIABLES)
  map_new()
  ans(_exportmapname)
  foreach (_variableName ${_variableNames})
    map_set("${_exportmapname}" "${_variableName}" "${${_variableName}}")
  endforeach()
  return_ref(_exportmapname)
endfunction()