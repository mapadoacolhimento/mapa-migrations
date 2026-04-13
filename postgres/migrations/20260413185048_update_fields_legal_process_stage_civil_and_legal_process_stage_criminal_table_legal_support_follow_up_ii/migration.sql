/*
  Warnings:

  - The `legal_process_stage_civil` column on the `legal_support_follow_up_ii` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `legal_process_stage_criminal` column on the `legal_support_follow_up_ii` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "survey"."legal_support_follow_up_ii" DROP COLUMN "legal_process_stage_civil",
ADD COLUMN     "legal_process_stage_civil" TEXT[],
DROP COLUMN "legal_process_stage_criminal",
ADD COLUMN     "legal_process_stage_criminal" TEXT[];
