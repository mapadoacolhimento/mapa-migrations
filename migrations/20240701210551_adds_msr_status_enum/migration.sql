/*
  Warnings:

  - Changed the type of `status` on the `MSRs` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "msr"."msr_status" AS ENUM ('registered', 'unsubscribed');

-- AlterTable
ALTER TABLE "msr"."MSRs" DROP COLUMN "status",
ADD COLUMN     "status" "msr"."msr_status" NOT NULL;
