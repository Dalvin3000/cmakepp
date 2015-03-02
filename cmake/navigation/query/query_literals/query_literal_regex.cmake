
  function(query_literal_regex input)
    ref_isvalid("${input}")
    ans(is_ref)
    if(is_ref)
      map_import_properties(${input} 
        match
        matchall
        replace
      )
    else()  
      set(match "${input}")
      set(matchall)
    endif()
    if(NOT replace )
      set(replace "$0")
    endif()

    if(NOT "${match}_" STREQUAL "_")
      regex_match_replace("${match}" "${replace}" "${ARGN}")
      ans(result)
      return_ref(result)
    elseif(NOT "${matchall}_" STREQUAL "_")
      string(REGEX MATCHALL "${matchall}" matches "${ARGN}")
      set(result)
      foreach(match ${matches})
        regex_match_replace("${matchall}" "${replace}" "${match}")
        ans_append(result)
      endforeach()
      return_ref(result)
    else()
      message(FATAL_ERROR "no regex speciefied (either match or matchall property needs to be set)")
    endif()
    return()
  endfunction()
