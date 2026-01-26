/*
  Warnings:

  - Changed the column `legal_action_difficulty` on the `msr_violence_history` table from a scalar field to a list field. If there are non-null values in that column, this step will fail.
  - Added the required column `emotional_symptoms` to the `survey_quality_of_life_d0` table without a default value. This is not possible if the table is not empty.
  - Added the required column `physical_symptoms` to the `survey_quality_of_life_d0` table without a default value. This is not possible if the table is not empty.
  - Added the required column `emotional_symptoms` to the `survey_quality_of_life_d180` table without a default value. This is not possible if the table is not empty.
  - Added the required column `physical_symptoms` to the `survey_quality_of_life_d180` table without a default value. This is not possible if the table is not empty.
  - Added the required column `emotional_symptoms` to the `survey_quality_of_life_d90` table without a default value. This is not possible if the table is not empty.
  - Added the required column `physical_symptoms` to the `survey_quality_of_life_d90` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "msr"."msr_violence_history"
ALTER COLUMN "legal_action_difficulty"
SET DATA TYPE "msr"."legal_action_difficulty"[]
USING
  CASE
    WHEN "legal_action_difficulty" IS NULL
      THEN NULL
    ELSE ARRAY["legal_action_difficulty"]
  END,
ALTER COLUMN "lives_with_perpetrator" DROP NOT NULL,
ALTER COLUMN "lives_with_perpetrator"
SET DATA TYPE "msr"."lives_with_perpetrator"
USING
  CASE
    WHEN "lives_with_perpetrator" IS NULL THEN NULL
    WHEN array_length("lives_with_perpetrator", 1) = 0 THEN NULL
    ELSE "lives_with_perpetrator"[1]
  END;

-- AlterTable
ALTER TABLE "survey"."survey_quality_of_life_d0" ADD COLUMN     "emotional_symptoms" TEXT NOT NULL,
ADD COLUMN     "physical_symptoms" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "survey"."survey_quality_of_life_d180" ADD COLUMN     "emotional_symptoms" TEXT NOT NULL,
ADD COLUMN     "physical_symptoms" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "survey"."survey_quality_of_life_d90" ADD COLUMN     "emotional_symptoms" TEXT NOT NULL,
ADD COLUMN     "physical_symptoms" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "survey"."survey_quality_of_life_d270" (
    "answer_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "quality_of_life" TEXT NOT NULL,
    "security" TEXT NOT NULL,
    "controlling_situations" TEXT NOT NULL,
    "self_esteem" TEXT NOT NULL,
    "physical_symptoms" TEXT NOT NULL,
    "emotional_symptoms" TEXT NOT NULL,
    "handle_violence_impact" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "survey_quality_of_life_d270_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."msr_psychological_support_conclusion" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "has_helped_with_questions" TEXT NOT NULL,
    "handle_stress_anxiety" TEXT NOT NULL,
    "satisfaction_level" TEXT NOT NULL,
    "continue_with_volunteer" TEXT NOT NULL,
    "experience_feedback" TEXT,
    "needed_public_services" TEXT NOT NULL,
    "informed_about_services" TEXT NOT NULL,
    "improvement_suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "msr_psychological_support_conclusion_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."msr_legal_support_conclusion" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "informed_about_case" TEXT NOT NULL,
    "handle_stress_anxiety" TEXT NOT NULL,
    "satisfaction_level" TEXT NOT NULL,
    "continue_with_volunteer" TEXT NOT NULL,
    "experience_feedback" TEXT,
    "needed_public_services" TEXT NOT NULL,
    "informed_about_services" TEXT NOT NULL,
    "improvement_suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "msr_legal_support_conclusion_pkey" PRIMARY KEY ("answer_id")
);

-- AddForeignKey
ALTER TABLE "survey"."survey_quality_of_life_d270" ADD CONSTRAINT "survey_quality_of_life_d270_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."msr_psychological_support_conclusion" ADD CONSTRAINT "msr_psychological_support_conclusion_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."msr_legal_support_conclusion" ADD CONSTRAINT "msr_legal_support_conclusion_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;
