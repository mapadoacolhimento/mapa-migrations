/*
  Warnings:

  - You are about to drop the column `matchStage` on the `match_confirmations` table. All the data in the column will be lost.
  - You are about to drop the column `matchType` on the `match_confirmations` table. All the data in the column will be lost.
  - Added the required column `match_stage` to the `match_confirmations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `match_type` to the `match_confirmations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "match"."match_confirmations" DROP COLUMN "matchStage",
DROP COLUMN "matchType",
ADD COLUMN     "match_stage" "match"."match_stage" NOT NULL,
ADD COLUMN     "match_type" "match"."match_type" NOT NULL;
