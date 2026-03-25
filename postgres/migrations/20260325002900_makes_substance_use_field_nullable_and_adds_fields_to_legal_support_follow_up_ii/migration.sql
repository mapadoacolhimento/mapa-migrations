/*
  Warnings:

  - You are about to drop the column `legal_process_stage` on the `legal_support_follow_up_ii` table. All the data in the column will be lost.
  - You are about to drop the column `has_helped_with_questions` on the `msr_psychological_support_conclusion` table. All the data in the column will be lost.
  - You are about to drop the column `has_helped_with_questions` on the `psychological_support_evaluation` table. All the data in the column will be lost.
  - Added the required column `is_strategy_useful` to the `msr_psychological_support_conclusion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "survey"."legal_support_follow_up_ii" DROP COLUMN "legal_process_stage",
ADD COLUMN     "legal_process_stage_civil" TEXT,
ADD COLUMN     "legal_process_stage_criminal" TEXT;

-- AlterTable
ALTER TABLE "survey"."msr_psychological_support_conclusion" DROP COLUMN "has_helped_with_questions",
ADD COLUMN     "is_strategy_useful" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "survey"."psychological_support_evaluation" DROP COLUMN "has_helped_with_questions";

-- AlterTable
ALTER TABLE "survey"."survey_quality_of_life_d180" ALTER COLUMN "substance_use" DROP NOT NULL;
