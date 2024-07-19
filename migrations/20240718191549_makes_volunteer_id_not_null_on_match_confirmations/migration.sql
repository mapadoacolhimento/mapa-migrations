/*
  Warnings:

  - Made the column `volunteer_id` on table `match_confirmations` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "match"."match_confirmations" ALTER COLUMN "volunteer_id" SET NOT NULL;
