// 1
MATCH (p:Person)
  WHERE p.name = 'ilya'
RETURN p;

// 2
MATCH (person)-[:LIKE]->(product)
  WHERE person.name = 'vlad'
RETURN product;

// 3
MATCH (person)-[l:LIKE]->(product)
  WHERE product.name = 'shawarma' AND l.rating > 0
RETURN person.name;

// 4
MATCH (person2)-[:BE_FRIEND]->(person)-[l:LIKE]->(pasta:PRODUCT)
  WHERE pasta.name = 'pasta' AND l.rating > 8
RETURN person2.name;

// 5
MATCH (person2)-[:BE_FRIEND]->(person)-[l:LIKE]->(product:PRODUCT)
  WHERE person2.name = 'ilya' AND l.rating > 6
  AND NOT (person2)-[:LIKE]->(product:PRODUCT)
RETURN product;


// 6
MATCH (ilya:Person)-[:BE_FRIEND]->(friend:Person)
RETURN friend;

// 7
MATCH ()-[l:LIKE]->(product:PRODUCT)
  WHERE l.rating = 8
RETURN product;

// 8
MATCH (person)-[l:LIKE]->(product)
  WHERE person.name = 'vlad' AND l.rating > 0
RETURN product;

// 9
MATCH (person)-[l:LIKE]->(product)
  WHERE product.name = 'shawarma' AND l.rating > 0
RETURN person;

// 10
MATCH ()-[l:LIKE]->(product:PRODUCT)
  WHERE l.rating < 0
RETURN product.name, l.rating;