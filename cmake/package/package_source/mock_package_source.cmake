
  function(mock_package_source name)
    metadata_package_source("${name}")
    ans(package_source)
    map_new()
    ans(graph)
    foreach(arg ${ARGN})
      if("${arg}" MATCHES "(.+)=>(.+)")
        set(dependency ${CMAKE_MATCH_2})
        set(dependee_id ${CMAKE_MATCH_1})
      else()
        set(dependency)
        set(dependee_id ${arg})
      endif()

      map_tryget(${graph} ${dependee_id})
      ans(dependee)
      if(NOT dependee)
        map_new()
        ans(dependee)
        map_set(${graph} ${dependee_id} ${dependee})
        map_set(${dependee} id ${dependee_id})
      endif()

      if(dependency)
        map_new()
        ans(ph)
        map_set(${ph} package_descriptor ${dependee})
        package_handle_update_dependencies(${ph} ${dependency})
      endif()

    endforeach()
    map_values(${graph})
    ans(pds)
    foreach(pd ${pds})
      assign(success = package_source.add_package_descriptor("${pd}"))
    endforeach()
    return_ref(package_source)
  endfunction()