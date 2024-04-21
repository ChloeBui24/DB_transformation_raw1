INSERT INTO Amazon_SMA (Timestamp, SMA)
SELECT
    key::TIMESTAMP AS Timestamp,
    (value->>'SMA')::NUMERIC(10, 4) AS SMA   
FROM
    RawData2,
    jsonb_each(raw_json->'Technical Analysis: SMA') AS timeseries(key, value)
ON CONFLICT (Timestamp)
DO NOTHING;
