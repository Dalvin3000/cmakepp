# removes the specified handler from the event idenfied by name
function(event_removehandler name handler)
  event_get("${name}")
  ans(event)
  if(NOT event)
    return(false)
  endif()
  map_tryget("${event}" handlers)
  ans(handlers)
  list_find(handlers "${handler}")
  ans(hasValue)
  if(hasValue LESS 0)
    return(false)
  endif()
  list_remove(handlers "${handler}")
  map_set("${event}" handlers "${handlers}")
  return(true)
endfunction()