/*
  Warnings:

  - You are about to drop the column `zendesk_user_id` on the `msrs` table. All the data in the column will be lost.
  - Added the required column `date_of_birth` to the `msr_pii` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_of_birth` to the `msr_pii` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "msr"."msrs" DROP COLUMN "zendesk_user_id";

-- AlterTable
ALTER TABLE "pii_mask"."msr_pii" ADD COLUMN     "date_of_birth" DATE NOT NULL;

-- AlterTable
ALTER TABLE "pii_sec"."msr_pii" ADD COLUMN     "date_of_birth" DATE NOT NULL;
