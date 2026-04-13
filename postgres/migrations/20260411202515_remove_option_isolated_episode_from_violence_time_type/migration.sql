/*
  Warnings:

  - The values [isolated_episode] on the enum `violence_time` will be removed. If these variants are still used in the database, this will fail.
  
*/
-- AlterEnum
BEGIN;
CREATE TYPE "msr"."violence_time_new" AS ENUM ('last_week', 'less_than_3_months', 'between_3_months_and_1_year', 'between_1_and_3_years', 'between_3_and_6_years', 'between_6_and_10_years', 'more_than_10_years');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "violence_time" TYPE "msr"."violence_time_new" USING ("violence_time"::text::"msr"."violence_time_new");
ALTER TYPE "msr"."violence_time" RENAME TO "violence_time_old";
ALTER TYPE "msr"."violence_time_new" RENAME TO "violence_time";
DROP TYPE "msr"."violence_time_old";
COMMIT;