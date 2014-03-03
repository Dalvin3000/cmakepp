function(test)

element(package)
	value(1)
	value(2)
	value(3)
	element(subelement)
		value(a)
		value(b)
		value(c)
		value(KEY k2 VALUE 1 2 3)
		element()
			value(I)
			value(II)
			value(III)
		element(END subelement2)
		element(k3)
			value(KEY a I)
			value(KEY b II)

		element(END)
	element(END subelement)
	value(4)
	value(VALUE 5)
	value(KEY k1 VALUE 1 2 3 4 5)
element(END)
# assert references are set
assert(package)
assert(subelement)
assert(subelement2)

map_navigate(${package} res "[0]")
assert(${res} STREQUAL 1)

map_navigate(${package} res "[1]")
assert(${res} STREQUAL 2)
map_navigate(${package} res "[2]")
assert(${res} STREQUAL 3)

map_navigate(${package} res "[3]")
assert(${res} STREQUAL subelement)
map_navigate(${package} res "subelement")
assert(${res} STREQUAL subelement)

map_navigate(${package} res "subelement[0]")
assert(${res} STREQUAL a)
map_navigate(${package} res "subelement[1]")
assert(${res} STREQUAL b)
map_navigate(${package} res "subelement[2]")
assert(${res} STREQUAL c)
map_navigate(${package} res "subelement[3]")
assert(EQUALS ${res} 1 2 3)
map_navigate(${package} res "subelement[4]")
assert(${res} STREQUAL ${subelement2})


map_navigate(${package} res "[3][0]")
assert(${res} STREQUAL a)
map_navigate(${package} res "[3][1]")
assert(${res} STREQUAL b)
map_navigate(${package} res "[3][2]")
assert(${res} STREQUAL c)
map_navigate(${package} res "[3][3]")
assert(EQUALS ${res}  1 2 3)
map_navigate(${package} res "[3][4]")
assert(EQUALS ${res}  ${subelement2})


map_navigate(${package} res "[3][4][0]")
assert(EQUALS ${res}  I)
map_navigate(${package} res "[3][4][1]")
assert(EQUALS ${res}  II)
map_navigate(${package} res "[3][4][2]")
assert(EQUALS ${res}  III)


map_navigate(${package} res "subelement[4][0]")
assert(EQUALS ${res}  I)
map_navigate(${package} res "subelement[4][1]")
assert(EQUALS ${res}  II)
map_navigate(${package} res "subelement[4][2]")
assert(EQUALS ${res}  III)

map_navigate(${package} res "[4]")
assert(${res} STREQUAL 4)


endfunction()