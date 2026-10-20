CREATE INDEX idx_parking_sessions_active
    ON parking_sessions (status)
    WHERE status = 'ACTIVE';
