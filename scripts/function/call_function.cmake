macro(call_function func)
	check_function("${func}")
	import_function("${func}" as function_to_call REDEFINE )
	function_to_call(${ARGN})
endmacro()