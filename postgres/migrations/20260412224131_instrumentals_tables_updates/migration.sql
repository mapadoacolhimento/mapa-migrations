/*
  Warnings:

  - The `public_service_referral_reason` column on the `legal_support_follow_up_i` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `public_service_referral_reason` column on the `legal_support_follow_up_ii` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `has_helped_with_questions` on the `msr_psychological_support_conclusion` table. All the data in the column will be lost.
  - The `public_service_referral_reason` column on the `psychological_support_follow_up_i` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `irregular_attendance_reason` column on the `psychological_support_follow_up_ii` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `public_service_referral_reason` column on the `psychological_support_follow_up_ii` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `challenges_faced` on the `volunteer_legal_support_conclusion` table. All the data in the column will be lost.
  - The `public_service_referral_reason` column on the `volunteer_legal_support_conclusion` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `challenges_faced` on the `volunteer_psychological_support_conclusion` table. All the data in the column will be lost.
  - The `public_service_referral_reason` column on the `volunteer_psychological_support_conclusion` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `is_strategy_useful` to the `msr_psychological_support_conclusion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "survey"."legal_support_follow_up_i" DROP COLUMN "public_service_referral_reason",
ADD COLUMN     "public_service_referral_reason" TEXT[];

-- AlterTable
ALTER TABLE "survey"."legal_support_follow_up_ii" DROP COLUMN "public_service_referral_reason",
ADD COLUMN     "public_service_referral_reason" TEXT[];

-- AlterTable
ALTER TABLE "survey"."msr_psychological_support_conclusion" DROP COLUMN "has_helped_with_questions",
ADD COLUMN     "is_strategy_useful" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "survey"."psychological_support_follow_up_i" DROP COLUMN "public_service_referral_reason",
ADD COLUMN     "public_service_referral_reason" TEXT[];

-- AlterTable
ALTER TABLE "survey"."psychological_support_follow_up_ii" DROP COLUMN "irregular_attendance_reason",
ADD COLUMN     "irregular_attendance_reason" TEXT[],
DROP COLUMN "public_service_referral_reason",
ADD COLUMN     "public_service_referral_reason" TEXT[];

-- AlterTable
ALTER TABLE "survey"."volunteer_legal_support_conclusion" DROP COLUMN "challenges_faced",
ADD COLUMN     "was_legal_action_required" BOOLEAN,
DROP COLUMN "public_service_referral_reason",
ADD COLUMN     "public_service_referral_reason" TEXT[];

-- AlterTable
ALTER TABLE "survey"."volunteer_psychological_support_conclusion" DROP COLUMN "challenges_faced",
DROP COLUMN "public_service_referral_reason",
ADD COLUMN     "public_service_referral_reason" TEXT[];

-- DropEnum
DROP TYPE "survey"."irregular_attendance_reason";

-- DropEnum
DROP TYPE "survey"."public_service_referral_reason";
