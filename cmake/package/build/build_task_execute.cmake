


function(build_task_execute buildTask parameters)    

    build_task_command_eval("${buildTask}" "${parameters}")
    ans(commands)
    map_tryget(${parameters} build_dir)
    ans(build_dir)


    pushd("${build_dir}" --create)
    ans(build_dir)
    log("trying to build in '${build_dir}'" --function "build_task_execute")

    ## todo - success handling + timestamp
    foreach(command ${commands})
        build_task_command_execute(${command})
        ans(success)
        if(NOT success)
            error("failed to execute command '${command}'")
            return(false)
        endif()
        
    endforeach()
    popd()

    map_tryget(${buildTask} output)
    ans(output)
    json_print(${buildTask})


    return(true)
endfunction()   