-- #1
SELECT *
FROM teachers;

-- #2
SELECT *
FROM student_group
WHERE speciality = 'ЭВМ';

-- #3
SELECT teacher_personal_number, audience_number
FROM teacher_subject_groups
WHERE subject_number = '18П';

-- 4

SELECT DISTINCT s.number, s.name
FROM teacher_subject_groups as tsg
         JOIN teachers t ON tsg.teacher_personal_number = t.personal_number
         JOIN subject s on tsg.subject_number = s.number
WHERE second_name = 'Костин';

-- 5

SELECT student_group_number
FROM teacher_subject_groups tsg
         JOIN teachers t ON tsg.teacher_personal_number = t.personal_number
WHERE t.second_name = 'Фролов';

-- 6

SELECT *
FROM subject
WHERE speciality = 'АСОИ';

-- 7

SELECT *
FROM teachers
WHERE speciality @> '{"АСОИ"}';

-- 8

SELECT distinct second_name
FROM teachers t
         JOIN teacher_subject_groups tsg ON t.personal_number = tsg.teacher_personal_number
WHERE tsg.audience_number = 210;


-- 9

SELECT distinct sg.speciality, sg.name
FROM teacher_subject_groups tsg
         JOIN student_group sg on tsg.student_group_number = sg.number
WHERE audience_number BETWEEN 100 AND 200;

-- 10

SELECT DISTINCT sg.name as first_group, sg1.name as second_group
FROM student_group sg
         JOIN student_group sg1 ON sg.speciality = sg1.speciality;

-- 11

SELECT sum(num_of_people) as sum_of_students
FROM student_group
WHERE speciality = 'ЭВМ';

-- 12

SELECT personal_number
FROM teachers
WHERE speciality @> '{"ЭВМ"}';

-- 13
WITH subject_number_count AS (SELECT count(s.number) as count, s.number
                              FROM subject s
                                       JOIN teacher_subject_groups tsg on s.number = tsg.subject_number
                              GROUP BY s.number)

SELECT number
FROM subject_number_count
WHERE subject_number_count.count = (SELECT count(*) as count
                                    FROM student_group);


-- 14

SELECT DISTINCT t.second_name
FROM teacher_subject_groups tsg
         JOIN teachers t ON t.personal_number = tsg.teacher_personal_number
WHERE subject_number IN (
    SELECT DISTINCT subject_number
    FROM teacher_subject_groups tsg
    WHERE tsg.teacher_personal_number = (
        SELECT DISTINCT tsg.teacher_personal_number
        FROM teacher_subject_groups tsg
        WHERE tsg.subject_number = '14П'
    )
);

-- 15
SELECT DISTINCT s.*
FROM teacher_subject_groups tsg
         JOIN subject s ON tsg.subject_number = s.number
WHERE subject_number NOT IN (
    SELECT DISTINCT subject_number
    FROM teacher_subject_groups tsg
    WHERE teacher_personal_number = '221Л'
);
-- в задании 221П, но это опечатка
SELECT s.*
FROM teacher_subject_groups tsg
         JOIN subject s ON tsg.subject_number = s.number
    EXCEPT
SELECT DISTINCT s.*
FROM teacher_subject_groups tsg
         JOIN subject s ON tsg.subject_number = s.number
WHERE teacher_personal_number = '221Л';

-- 16
SELECT DISTINCT s.*
FROM teacher_subject_groups tsg
         JOIN subject s ON tsg.subject_number = s.number
WHERE subject_number NOT IN (
    SELECT subject_number
    FROM teacher_subject_groups
    WHERE student_group_number = (
        SELECT number
        FROM student_group
        WHERE name = 'М-6'
    )
);

-- 17

SELECT DISTINCT t.*
FROM teacher_subject_groups tsg
         JOIN teachers t ON tsg.teacher_personal_number = t.personal_number
WHERE tsg.student_group_number IN ('3Г', '8Г')
  AND t.post = 'Доцент';

-- 18

SELECT tsg.subject_number, tsg.teacher_personal_number, tsg.student_group_number
FROM teacher_subject_groups tsg
         JOIN teachers t ON t.personal_number = tsg.teacher_personal_number
WHERE department = 'ЭВМ'
  AND speciality @> '{АСОИ}';

-- 19
SELECT DISTINCT tsg.student_group_number
FROM teacher_subject_groups tsg
         JOIN teachers t ON t.personal_number = tsg.teacher_personal_number
         JOIN student_group sg ON sg.number = tsg.student_group_number
WHERE sg.speciality = ANY (t.speciality);

-- 20
SELECT DISTINCT t.personal_number
FROM teacher_subject_groups tsg
         JOIN teachers t ON t.personal_number = tsg.teacher_personal_number
         JOIN student_group sg ON sg.number = tsg.student_group_number
WHERE department = 'ЭВМ'
  AND sg.speciality = ANY (t.speciality);

-- 21

SELECT DISTINCT sg.speciality
FROM teacher_subject_groups tsg
         JOIN teachers t on tsg.teacher_personal_number = t.personal_number
         JOIN student_group sg ON tsg.student_group_number = sg.number
WHERE department = 'АСУ';

-- 22

SELECT subject_number
FROM teacher_subject_groups tsg
         JOIN student_group sg ON sg.number = tsg.student_group_number
WHERE sg.name = 'АС-8';

-- 23
SELECT DISTINCT student_group_number
FROM teacher_subject_groups tsg
WHERE subject_number IN (
    SELECT subject_number
    FROM teacher_subject_groups tsg
             JOIN student_group sg ON sg.number = tsg.student_group_number
    WHERE sg.name = 'АС-8'
);

-- 24
SELECT DISTINCT student_group_number
FROM teacher_subject_groups tsg
WHERE student_group_number NoT IN (
    SELECT DISTINCT student_group_number
    FROM teacher_subject_groups tsg
    WHERE subject_number IN (
        SELECT subject_number
        FROM teacher_subject_groups tsg
                 JOIN student_group sg ON sg.number = tsg.student_group_number
        WHERE sg.name = 'АС-8'
    )
);
-- 25

SELECT DISTINCT student_group_number
FROM teacher_subject_groups tsg
WHERE student_group_number NOT IN (
    SELECT DISTINCT student_group_number
    FROM teacher_subject_groups tsg
    WHERE subject_number IN (
        SELECT subject_number
        FROM teacher_subject_groups tsg
        WHERE tsg.teacher_personal_number = '430Л'
    )
);

-- 26
SELECT DISTINCT tsg.teacher_personal_number
FROM teacher_subject_groups tsg
         JOIN student_group sg ON tsg.student_group_number = sg.number
WHERE tsg.subject_number <> '12П'
  AND sg.name = 'Э-15';

