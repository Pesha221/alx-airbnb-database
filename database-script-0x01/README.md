| Feature                   | Implementation                                            |
| ------------------------- | --------------------------------------------------------- |
| **UUIDs**                 | Used as CHAR(36) for all primary keys                     |
| **Referential Integrity** | All FK constraints cascade on delete/update               |
| **Enum Constraints**      | Used for `role`, `status`, and `payment_method`           |
| **Automatic Timestamps**  | All tables track creation time                            |
| **Indexes**               | Added to email, foreign keys, and search-critical columns |
| **3NF Compliance**        | All attributes depend only on primary keys                |
