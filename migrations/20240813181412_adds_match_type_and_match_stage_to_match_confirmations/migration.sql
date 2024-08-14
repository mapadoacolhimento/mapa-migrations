/*
  Warnings:

  - Added the required column `matchStage` to the `match_confirmations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `matchType` to the `match_confirmations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "match"."match_confirmations" ADD COLUMN     "matchStage" "match"."match_stage" NOT NULL,
ADD COLUMN     "matchType" "match"."match_type" NOT NULL;
