Вывод оценок пользователей:
----------------------------------------------------
SELECT
    clients.client_full_name,
    reviews.product_id,
    reviews.review,
    reviews.comment
FROM
    clients
LEFT OUTER JOIN reviews ON(
        clients.client_id = reviews.client_id
    );
----------------------------------------------------
Вывод приобретенного товара пользователями:
----------------------------------------------------
SELECT
    clients.client_full_name,
    products.product_name,
    branches.full_name,
    products_in_purchase.amount
FROM
    clients
JOIN purchases ON(
        clients.client_id = purchases.client_id
    )
JOIN products_in_purchase ON(
        purchases.purchase_id = products_in_purchase.purchase_id
    )
JOIN products ON(
        products.product_id = products_in_purchase.product_id
    )
JOIN branches ON(
        products_in_purchase.branch_id = branches.branch_id
    );
----------------------------------------------------
Вывод поставок товара в филиалы:
----------------------------------------------------
SELECT
    suppliers.full_name,
    branches.full_name,
    products.product_name,
    product_suppliy.supply_date,
    product_suppliy.supply_amount
FROM
    product_suppliy
JOIN suppliers ON(
        suppliers.supl_id = product_suppliy.supplier_id
    )
JOIN branches ON(
        branches.branch_id = product_suppliy.branch_id
    )
JOIN products ON(
        products.product_id = product_suppliy.product_id
    );
----------------------------------------------------
Вывод количества доступного товара в филиалах:
----------------------------------------------------
SELECT
    branches.full_name,
    products.product_name,
    availability.aviailable_amount
FROM
    availability
JOIN branches ON(
        branches.branch_id = availability.branch_id
    )
JOIN products ON(
        products.product_id = availability.product_id
    );
----------------------------------------------------