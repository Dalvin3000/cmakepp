
parameter_definition(
  recipe_build 
  [--build-params:<any>]
  )
  
function(recipe_build)
  arguments_extract_defined_values(0 ${ARGC} recipe_build)
  ans(args)

  recipe_load(${args})
  ans(package_handle)

  if(NOT package_handle)
    return()
  endif()

  if(NOT build_params)
    build_params()
    ans(build_params)
    message("buildparams x ${build_params}")
  endif()
  
  json_print(${build_params})

  package_handle_build_config("${package_handle}" "${build_params}") 
  ans(build)

  map_append(${package_handle} builds ${build})  
  
  return_ref(package_handle)
endfunction()



