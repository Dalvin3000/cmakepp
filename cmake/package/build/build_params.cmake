
 parameter_definition(build_params
    [--generator:<string>]
    [--config:<string>]
    [--release]
    [--debug]
    
    )
  function(build_params)
    arguments_extract_defined_values(0 ${ARGC} build_params)    
    ans(args)


    if(NOT generator)
      is_script_mode()
      ans(isScriptMode)
      if(isScriptMode)
        cmake_environment()
        ans(env)
        assign(generator = env.cmake.default_generator)
      else()
        set(generator "${CMAKE_GENERATOR}")
      endif()
      
    endif()    



    if(release)
      set(config release)
    endif()
    if(debug)
      set(config debug)
    endif()

    if(NOT config)
      set(config release)
    endif()

    cmake_build_environment("${generator}" ${args})
    ans(param)

    map_set(${param} config ${config})



    return(${param})

  endfunction()