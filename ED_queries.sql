-- ------------------Estudo Dirigido SQL - Gustavo Martins-----------------------


-- letra A)

SELECT id,name, date_of_birth FROM library_users

--letra B)

SELECT title, edition, publisher
FROM library_books 
WHERE UPPER(title) LIKE '%DATABASE%'

--letra C)

SELECT b.title, e.code, e.acquisition_date 
FROM library_exemplars e
JOIN library_books b ON e.book_id = b.id
WHERE e.acquisition_date >= '2022-01-01 00:00:00';

-- Letra D)

SELECT CONCAT(title, ': ', subtitle) AS title_subtitle
FROM library_books
ORDER BY title

-- Letra E)

SELECT c.name AS category, b.title, b.edition,COUNT(e.book_id) AS Exemplars_Quantity FROM library_books b
JOIN library_categories c ON c.id=b.category_id
JOIN library_exemplars e ON e.book_id=b.id
WHERE UPPER(c.name) = 'BANCO DE DADOS'
GROUP BY b.id, b.title, b.edition, c.name

-- Letra F)

SELECT lu.name, lu.username, COUNT(lr.id) AS borrowed_exemplars
FROM library_users lu
JOIN library_reservations lr ON lu.id = lr.user_id
WHERE lr.status IN (4, 5, 6)
GROUP BY lu.name, lu.username
HAVING 
    COUNT(lr.id) = (
        SELECT MAX(borrowed_count) 
        FROM (
            SELECT COUNT(lri.id) AS borrowed_count
            FROM library_reservations lri
           WHERE lri.status IN (4, 5, 6)
            GROUP BY lri.user_id
        ) subquery
    )

-- Letra G)

SELECT DISTINCT e.id, r.request_date, r.approved_date, r.return_date, r.approved_by  FROM library_exemplars e
JOIN library_reservations r ON r.exemplar_id=e.id
JOIN library_users u ON u.id = r.approved_by
WHERE (r.request_date != NULL) OR (r.approved_date != NULL) OR (r.return_date != NULL) OR NOT(r.approved_by=149 OR r.approved_by=228)
-- select * from library_users u
-- where upper(u.name) ILIKE '%AYRTON%'

-- Letra H)

SELECT b.title, c.name,COUNT(e.book_id) AS count_exemplar 
FROM library_books b
JOIN library_categories c ON c.id=b.category_id
JOIN library_exemplars e ON e.book_id=b.id
GROUP BY b.title, c.name
HAVING COUNT(e.book_id)>1

-- Letra I)

SELECT b.title, c.name AS category_name, r.book_id, r.loan_date 
FROM library_books b
JOIN library_categories c ON c.id = b.category_id
LEFT JOIN library_reservations r ON r.book_id = b.id 
WHERE r.loan_date IS NULL

-- Letra J)

SELECT lb.title, COUNT(lba.author_id) AS authors, lu.name
FROM library_books lb
JOIN library_books_authors lba ON lb.id = lba.book_id
JOIN library_reservations lr ON lr.book_id = lb.id
JOIN library_users lu ON lr.user_id = lu.id
GROUP BY lb.title, lu.name
HAVING COUNT(lba.author_id) > 1
