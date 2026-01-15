/*
  Warnings:

  - The `lives_with_perpetrator` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "msr"."lives_with_perpetrator" AS ENUM ('yes', 'no', 'never');

-- AlterEnum
ALTER TYPE "msr"."protective_factors" ADD VALUE 'not_applicable';

-- AlterEnum
ALTER TYPE "msr"."risk_factors" ADD VALUE 'not_applicable';

-- AlterTable
ALTER TABLE "msr"."msr_violence_history" DROP COLUMN "lives_with_perpetrator",
ADD COLUMN     "lives_with_perpetrator" "msr"."lives_with_perpetrator"[];
