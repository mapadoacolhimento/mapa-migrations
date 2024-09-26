/*
  Warnings:

  - Added the required column `gender` to the `MSRs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `zendesk_user_id` to the `MSRs` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `race_color` on the `MSRs` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "msr"."MSRs" ADD COLUMN     "accepts_online_support" BOOLEAN,
ADD COLUMN     "gender" "public"."gender" NOT NULL,
ADD COLUMN     "has_disability" BOOLEAN,
ADD COLUMN     "zendesk_user_id" BIGINT NOT NULL,
DROP COLUMN "race_color",
ADD COLUMN     "race_color" "public"."race" NOT NULL;
