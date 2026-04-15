/*
  Warnings:

  - The `interruption_reason` column on the `support_interruption` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "survey"."support_interruption" ADD COLUMN     "exit_reason" TEXT,
DROP COLUMN "interruption_reason",
ADD COLUMN     "interruption_reason" TEXT[];

-- DropEnum
DROP TYPE "survey"."interruption_reason";
