CREATE TABLE raw_orders (
    id INTEGER NOT NULL, order_date DATE NOT NULL, status VARCHAR(16) NOT NULL, country VARCHAR(2) NOT NULL, customer_id INTEGER NOT NULL, amount INTEGER NOT NULL, updated_at DATE NOT NULL
);

INSERT INTO
    raw_orders (
        id, order_date, status, country, customer_id, amount, updated_at
    )
VALUES (
        1, '2022-01-01', 'completed', 'FR', 1, 75, '2022-01-05'
    );

INSERT INTO
    raw_orders (
        id, order_date, status, country, customer_id, amount, updated_at
    )
VALUES (
        2, '2022-01-13', 'completed', 'US', 2, 150, '2022-01-20'
    );

INSERT INTO
    raw_orders (
        id, order_date, status, country, customer_id, amount, updated_at
    )
VALUES (
        3, '2022-02-03', 'completed', 'US', 2, 150, '2022-02-08'
    );

INSERT INTO
    raw_orders (
        id, order_date, status, country, customer_id, amount, updated_at
    )
VALUES (
        4, '2022-04-06', 'completed', 'FR', 3, 150, '2022-04-10'
    );

INSERT INTO
    raw_orders (
        id, order_date, status, country, customer_id, amount, updated_at
    )
VALUES (
        5, '2022-07-05', 'shipped', 'ES', 1, 300, '2022-07-06'
    );

INSERT INTO
    raw_orders (
        id, order_date, status, country, customer_id, amount, updated_at
    )
VALUES (
        2, '2022-01-12', 'partial_refunded', 'US', 2, 150, '2022-07-20'
    );

INSERT INTO
    raw_orders (
        id, order_date, status, country, customer_id, amount, updated_at
    )
VALUES (
        5, '2022-07-05', 'shipped', 'ES', 1, 300, '2022-07-20'
    );
