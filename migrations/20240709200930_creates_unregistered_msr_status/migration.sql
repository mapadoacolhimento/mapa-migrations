/*
  Warnings:

  - The values [unsubscribed] on the enum `msr_status` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "msr"."msr_status_new" AS ENUM ('registered', 'unregistered');
ALTER TABLE "msr"."msrs" ALTER COLUMN "status" TYPE "msr"."msr_status_new" USING ("status"::text::"msr"."msr_status_new");
ALTER TYPE "msr"."msr_status" RENAME TO "msr_status_old";
ALTER TYPE "msr"."msr_status_new" RENAME TO "msr_status";
DROP TYPE "msr"."msr_status_old";
COMMIT;
