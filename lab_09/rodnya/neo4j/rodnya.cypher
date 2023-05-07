-- свояченица

match
    (m)-[:MARRIAGE]->()<-[:MOTHER]-()-[:MOTHER]->(s {gender: 'female'})
return m, s

-- свекровь

match
    (w)<-[:MARRIAGE]-()<-[:MOTHER]-(s)
return w, s

-- шурин

match
    (m)-[:MARRIAGE]->()<-[:MOTHER]-()-[:MOTHER]->(s {gender: 'male'})
return m, s

-- золовка

match
    (w)<-[:MARRIAGE]-()<-[:MOTHER]-()-[:MOTHER]->(s {gender: 'female'})
return w, s

-- сноха

match
    (s)-[:MOTHER]->()-[:MARRIAGE]->(w)
return s, w
