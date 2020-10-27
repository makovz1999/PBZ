-- variant 5

-- 28
SELECT ppdn.project_id
FROM provider_project_detail_numbers ppdn
         JOIN details d on d.id = ppdn.detail_id
         JOIn providers p on ppdn.provider_id = p.id
WHERE d.color = 'Красный'
  AND p.city = 'Лондон';

-- 15
SELECT count(*)
FROM projects p
         JOIN provider_project_detail_numbers ppdn on p.id = ppdn.project_id
WHERE ppdn.provider_id = 'П1';

-- 23
SELECT DISTINCT p.id
FROM provider_project_detail_numbers ppdn
         JOIN providers p on p.id = ppdn.provider_id
         JOIN details d on d.id = ppdn.detail_id
WHERE d.color = 'Красный';

-- 10
SELECT d.name
FROM details d
         JOIN provider_project_detail_numbers ppdn on d.id = ppdn.detail_id
         JOIN providers p on p.id = ppdn.provider_id
         JOIN projects p2 on ppdn.project_id = p2.id
WHERE p.city = 'Лондон'
  AND p2.city = 'Лондон';


-- 3
SELECT provider_id
FROM provider_project_detail_numbers
WHERE project_id = 'ПР1';

-- 5
SELECT DISTINCT d.color, d2.city
FROM details d
         CROSS JOIN details d2;


-- 9
SELECT d.name
FROM details d
         JOIN provider_project_detail_numbers ppdn on d.id = ppdn.detail_id
         JOIN providers p on p.id = ppdn.provider_id
WHERE p.city = 'Лондон';

-- 34
SELECT ppdn.detail_id
FROM provider_project_detail_numbers ppdn
         join providers p on p.id = ppdn.provider_id
         join projects p2 on p2.id = ppdn.project_id
WHERE p.city = 'Лондон'
   OR p2.city = 'Лондон';
-- 14
SELECT d.id, d2.id
FROM details d
         JOIN provider_project_detail_numbers ppdn on d.id = ppdn.detail_id
         JOIN providers p on ppdn.provider_id = p.id
         CROSS JOIN details d2;

-- 29
SELECT ppdn.project_id
FROM provider_project_detail_numbers ppdn
WHERE ppdn.provider_id = 'П1';

SELECT p.city, p2.city
FROM provider_project_detail_numbers ppdn
         JOIN providers p on p.id = ppdn.provider_id
         JOIN projects p2 on p2.id = ppdn.project_id;