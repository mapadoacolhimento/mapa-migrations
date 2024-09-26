/*
  Warnings:

  - The values [volunteer] on the enum `match_type` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "match"."match_type_new" AS ENUM ('msr', 'daily', 'manual', 'old');
ALTER TABLE "match"."matches" ALTER COLUMN "match_type" TYPE "match"."match_type_new" USING ("match_type"::text::"match"."match_type_new");
ALTER TYPE "match"."match_type" RENAME TO "match_type_old";
ALTER TYPE "match"."match_type_new" RENAME TO "match_type";
DROP TYPE "match"."match_type_old";
COMMIT;
