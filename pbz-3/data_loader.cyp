CREATE(ilya:Person {name: 'ilya', email: 'ilya@mail.com'});

MATCH(p:Person)
  WHERE p.name = 'ilya'
CREATE(p)-[:LIKE {rating: 10}]->(shawarma:PRODUCT {name: 'shawarma', type: 'meat'});


MATCH(ilya:Person)
  WHERE ilya.name = 'ilya'
CREATE(ilya)-[:LIKE {rating: 9}]->(pasta:PRODUCT {name: 'pasta', type: 'flour'});


MATCH(ilya:Person)
  WHERE ilya.name = 'ilya'
CREATE(ilya)-[:LIKE {rating: -8}]->(olive:PRODUCT {name: 'olive', type: 'berry'});

MATCH(ilya:Person)
  WHERE ilya.name = 'ilya'
CREATE(ilya)-[:LIKE {rating: -8}]->(seaweed:PRODUCT {name: 'seaweed', type: 'seaweed'});

MATCH(ilya:Person)
  WHERE ilya.name = 'ilya'
CREATE(ilya)-[:LIKE {rating: 8}]->(oatmeal:PRODUCT {name: 'oatmeal', type: 'porridge'});

MATCH (shawarma:PRODUCT)
  WHERE shawarma.name = 'shawarma'
CREATE(vlad:Person {name: 'vlad', email: 'vlad@mail.com'})-[:LIKE {rating: 9}]->(shawarma);

MATCH(vlad:Person), (pasta:PRODUCT)
  WHERE vlad.name = 'vlad' AND pasta.name = 'pasta'
CREATE(vlad)-[:LIKE {rating: 8}]->(pasta);

MATCH(vlad:Person)
  WHERE vlad.name = 'vlad'
CREATE(vlad)-[:LIKE {rating: 7}]->(pizza:PRODUCT {name: 'pizza', type: 'flour'});

MATCH(vlad:Person), (oatmeal:PRODUCT)
  WHERE vlad.name = 'vlad' AND oatmeal.name = 'oatmeal'
CREATE(vlad)-[:LIKE {rating: -6}]->(oatmeal);

CREATE(sasha:Person {name: 'sasha', email: 'sasha@mail.com'});

MATCH(sasha:Person), (pasta:PRODUCT)
  WHERE sasha.name = 'sasha' AND pasta.name = 'pasta'
CREATE(sasha)-[:LIKE {rating: -5}]->(pasta);

MATCH(sasha:Person), (shawarma:PRODUCT)
  WHERE sasha.name = 'sasha' AND shawarma.name = 'shawarma'
CREATE(sasha)-[:LIKE {rating: -3}]->(shawarma);

CREATE(sasha)-[:LIKE {rating: 5}]->(burrito:PRODUCT {name: 'burrito', type: 'meat'});

MATCH(ilya:Person), (vlad:Person)
  WHERE ilya.name = 'ilya' AND vlad.name = 'vlad'
CREATE(ilya)-[:BE_FRIEND]->(vlad);

MATCH(ilya:Person), (vlad:Person)
  WHERE ilya.name = 'ilya' AND vlad.name = 'vlad'
CREATE(ilya)<-[:BE_FRIEND]-(vlad);

MATCH(sasha:Person), (vlad:Person)
  WHERE sasha.name = 'sasha' AND vlad.name = 'vlad'
CREATE(vlad)<-[:BE_FRIEND]-(sasha);

MATCH(sasha:Person), (vlad:Person)
  WHERE sasha.name = 'sasha' AND vlad.name = 'vlad'
CREATE(vlad)-[:BE_FRIEND]->(sasha);

MATCH(n)
DETACH
DELETE n;



