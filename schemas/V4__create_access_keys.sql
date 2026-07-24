CREATE TABLE access_keys (
    id           UUID PRIMARY KEY,
    vehicle_id    UUID         NOT NULL UNIQUE REFERENCES vehicles (id),
    code         VARCHAR(50)  NOT NULL UNIQUE,
    active       BOOLEAN      NOT NULL,
    created_at    TIMESTAMP    NOT NULL,
    updated_at    TIMESTAMP    NOT NULL
);
