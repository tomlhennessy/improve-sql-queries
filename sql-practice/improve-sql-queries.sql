-- Step 0: Initial Query
SELECT cats.*
FROM cats
JOIN cat_toys ON cats.id = cat_toys.cat_id
WHERE cat_toys.toy_id = 5;

-- Step 1: Analyze the Query
.timer on
EXPLAIN QUERY PLAN
SELECT cats.*
FROM cats
JOIN cat_toys ON cats.id = cat_toys.cat_id
WHERE cat_toys.toy_id = 5;

-- Step 2: Baseline Timing
-- Run Time: real 0.000 user 0.000071 sys 0.000033

-- Step 3: Add Index
DROP INDEX IF EXISTS idx_cat_toys_toy_id;  -- Ensure no duplicate index
CREATE INDEX idx_cat_toys_toy_id ON cat_toys(toy_id);

-- Step 4: Re-analyze the Query
EXPLAIN QUERY PLAN
SELECT cats.*
FROM cats
JOIN cat_toys ON cats.id = cat_toys.cat_id
WHERE cat_toys.toy_id = 5;

-- Step 4: Re-time the Query
-- Run Time: real 0.000 user 0.000044 sys 0.000004
-- Observations:
-- - The query is significantly faster after the index was applied.
-- - The index is effectively being used in the query plan.
