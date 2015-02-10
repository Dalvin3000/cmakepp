  function(cmake_string_escape str)
    string(REPLACE "\\" "\\\\" str "${str}")
    string(REPLACE "\"" "\\\"" str "${str}")
    string(REPLACE "(" "\\(" str "${str}")
    string(REPLACE ")" "\\)" str "${str}")
    string(REPLACE "$" "\\$" str "${str}") 
    string(REPLACE "#" "\\#" str "${str}") 
    string(REPLACE "^" "\\^" str "${str}") 
    string(REPLACE "\t" "\\t" str "${str}")
    string(REPLACE ";" "\\;" str "${str}")
    string(REPLACE "\n" "\\n" str "${str}")
    string(REPLACE "\r" "\\r" str "${str}")
    #string(REPLACE "\0" "\\0" str "${str}") unnecessary because cmake does not support nullcahr in string
    string(REPLACE " " "\\ " str "${str}")
    return_ref(str)
  endfunction()
