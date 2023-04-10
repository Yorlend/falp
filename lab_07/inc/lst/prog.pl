domains
	address = address(symbol City, symbol Street, integer HouseNum, integer AppartNum).
predicates
	telephone(symbol Surname, symbol TelNum, address).
	car(symbol Surname, symbol Mark, symbol Color, integer Cost, symbol Number).
clauses
    telephone(ivanov,   "+79162694425", address(smolensk, baumanskaya,   9, 38)).
	telephone(sidorov,  "+79578163207", address(moscow,   pushkinskaya, 69, 29)).
	telephone(petrova,  "+79690758483", address(omsk,     lermontova,   65,  6)).
	telephone(sidorova, "+79917012024", address(omsk,     baumanskaya,  82, 79)).
	telephone(petrova,  "+79533641292", address(moscow,   leninskaya,   33, 79)).
	car(petrov,   shkoda, white,  900000, fa200ee).
	car(petrova,  hynday, blue,   720000, aa111qq).
	car(sidorova, shkoda, gray,   900000, oe321ww).
	car(ivanova,  opel,   black,  800000, ls123qq).
	car(sidorov,  hynday, gray,  1000000, op391jd).
goal	
	car(Name, shkoda, gray, _, _), telephone(Name, Phone,  address(Town, _, _, _)).