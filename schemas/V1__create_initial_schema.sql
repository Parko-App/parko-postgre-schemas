CREATE TABLE users (
    id                    UUID PRIMARY KEY,
    student_id            VARCHAR(255) NOT NULL UNIQUE,
    full_name              VARCHAR(255) NOT NULL,
    email                 VARCHAR(255) NOT NULL UNIQUE,
    password_hash          VARCHAR(255) NOT NULL,
    role                  VARCHAR(50)  NOT NULL,
    institutional_domain    VARCHAR(50)  NOT NULL,
    email_verified         BOOLEAN      NOT NULL,
    created_at             TIMESTAMP    NOT NULL,
    updated_at             TIMESTAMP    NOT NULL
);

CREATE TABLE vehicles (
    id           UUID PRIMARY KEY,
    user_id       UUID         NOT NULL REFERENCES users (id),
    plate        VARCHAR(50)  NOT NULL UNIQUE,
    brand        VARCHAR(255) NOT NULL,
    model        VARCHAR(255) NOT NULL,
    active       BOOLEAN      NOT NULL,
    created_at    TIMESTAMP    NOT NULL,
    updated_at    TIMESTAMP    NOT NULL
);

CREATE TABLE balance_accounts (
    id           UUID PRIMARY KEY,
    user_id       UUID           NOT NULL UNIQUE REFERENCES users (id),
    amount       NUMERIC(12, 2) NOT NULL,
    created_at    TIMESTAMP      NOT NULL,
    updated_at    TIMESTAMP      NOT NULL
);

CREATE TABLE parking_sessions (
    id              UUID PRIMARY KEY,
    vehicle_id       UUID         REFERENCES vehicles (id),
    plate_snapshot    VARCHAR(50),
    session_type     VARCHAR(50)  NOT NULL,
    status          VARCHAR(50)  NOT NULL,
    entry_at         TIMESTAMP    NOT NULL,
    exit_at          TIMESTAMP,
    created_at       TIMESTAMP    NOT NULL,
    updated_at       TIMESTAMP    NOT NULL
);

CREATE TABLE tickets (
    id                    UUID PRIMARY KEY,
    parking_session_id      UUID         NOT NULL UNIQUE REFERENCES parking_sessions (id),
    ticket_number          VARCHAR(50)  NOT NULL UNIQUE,
    qr_data                TEXT         NOT NULL,
    status                VARCHAR(50)  NOT NULL,
    issued_at              TIMESTAMP    NOT NULL,
    paid_at                TIMESTAMP,
    created_at             TIMESTAMP    NOT NULL,
    updated_at             TIMESTAMP    NOT NULL
);

CREATE TABLE transactions (
    id                    UUID PRIMARY KEY,
    balance_account_id      UUID           REFERENCES balance_accounts (id),
    parking_session_id      UUID           REFERENCES parking_sessions (id),
    type                  VARCHAR(50)    NOT NULL,
    amount                NUMERIC(12, 2) NOT NULL,
    status                VARCHAR(50)    NOT NULL,
    payment_provider        VARCHAR(255)   NOT NULL,
    external_ref            VARCHAR(255),
    created_at             TIMESTAMP      NOT NULL,
    updated_at             TIMESTAMP      NOT NULL
);

CREATE TABLE access_log (
    id                    UUID PRIMARY KEY,
    parking_session_id      UUID         REFERENCES parking_sessions (id),
    event_type             VARCHAR(50)  NOT NULL,
    access_method           VARCHAR(50)  NOT NULL,
    result                VARCHAR(50)  NOT NULL,
    raw_payload            TEXT         NOT NULL,
    occurred_at            TIMESTAMP    NOT NULL,
    created_at             TIMESTAMP    NOT NULL,
    updated_at             TIMESTAMP    NOT NULL
);
