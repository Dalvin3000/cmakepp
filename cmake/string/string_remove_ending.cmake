## `(<original:<string>> <ending:<string>>)-><original:<string>>`
##
## Removes the back "n"-chars of the string "original".
## Number of chars "n" is calculated based on string "ending".
##
## **Examples**
##  set(input "abc")
##  string_remove_ending("${input}" "a") # => "ab"
##  string_remove_ending("${input}" "ab") # => "a"
##
##
function(string_remove_ending original ending)
  string(LENGTH "${ending}" len)
  string(LENGTH "${original}" orig_len)
  math(EXPR len "${orig_len} - ${len}")
  string(SUBSTRING "${original}" 0 ${len} original)

  return_ref(original)
endfunction()
