/*
  Warnings:

  - You are about to drop the column `last_name` on the `msr_pii` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "pii_sec"."msr_pii" DROP COLUMN "last_name";
