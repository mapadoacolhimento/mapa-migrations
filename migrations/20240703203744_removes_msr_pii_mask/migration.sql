/*
  Warnings:

  - You are about to drop the `msr_pii` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "pii_mask"."msr_pii" DROP CONSTRAINT "msr_pii_msr_id_fkey";

-- DropTable
DROP TABLE "pii_mask"."msr_pii";
