/*
  Warnings:

  - The values [failed] on the enum `match_confirmation_status` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "match"."match_confirmation_status_new" AS ENUM ('waiting', 'confirmed', 'denied', 'expired');
ALTER TABLE "match"."match_confirmations" ALTER COLUMN "status" TYPE "match"."match_confirmation_status_new" USING ("status"::text::"match"."match_confirmation_status_new");
ALTER TABLE "match"."match_confirmation_status_history" ALTER COLUMN "status" TYPE "match"."match_confirmation_status_new" USING ("status"::text::"match"."match_confirmation_status_new");
ALTER TYPE "match"."match_confirmation_status" RENAME TO "match_confirmation_status_old";
ALTER TYPE "match"."match_confirmation_status_new" RENAME TO "match_confirmation_status";
DROP TYPE "match"."match_confirmation_status_old";
COMMIT;
