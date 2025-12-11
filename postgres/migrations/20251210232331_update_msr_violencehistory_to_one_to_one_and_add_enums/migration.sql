/*
  Warnings:

  - The `has_monthly_income` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `work_situation` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `has_financial_dependents` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `family_income_responsibility` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `owns_property` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `violence_types` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `violence_period` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `violence_author_gender` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `violence_author_relationship` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `violence_location` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `legal_actions_taken` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `police_report_difficulty` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `protective_factors` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `risk_factors` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[msr_id]` on the table `msr_violence_history` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "msr"."violence_type" AS ENUM ('physicalViolence', 'psychologicalViolence', 'sexualViolence', 'digitalViolence', 'patrimonialViolence', 'obstetricViolence', 'threat', 'politicalViolence', 'noViolence');

-- CreateEnum
CREATE TYPE "msr"."violence_period" AS ENUM ('isolatedEpisode', 'lastWeek', 'threeMonths', 'moreThanThreeMonths', 'moreThanAYear', 'moreThanThreeYears', 'moreThanSixYears', 'moreThanTenYears');

-- CreateEnum
CREATE TYPE "msr"."perpetrator_gender" AS ENUM ('woman', 'man', 'non_binary');

-- CreateEnum
CREATE TYPE "msr"."perpetrator_relationship" AS ENUM ('nuclearFamily', 'closeFamily', 'currentPartner', 'formerPartner', 'workColleague', 'otherPeople');

-- CreateEnum
CREATE TYPE "msr"."violence_location" AS ENUM ('homeSpace', 'publicSpace', 'workSpace', 'internetSpace');

-- CreateEnum
CREATE TYPE "msr"."police_report_difficulty" AS ENUM ('no', 'discourageReporting', 'notTheirCompetence', 'refusedToReport', 'others', 'n_a');

-- CreateEnum
CREATE TYPE "msr"."legal_action" AS ENUM ('physicalExamination', 'policeInquiry', 'criminalCase', 'civilCase', 'labourCase', 'noneTaken');

-- CreateEnum
CREATE TYPE "msr"."protective_factor" AS ENUM ('supportNetwork', 'dontLiveWithPerpetrator', 'fellsSafe', 'isNotDependant', 'n_a');

-- CreateEnum
CREATE TYPE "msr"."risk_factor" AS ENUM ('gunAccess', 'imprisonment', 'violenceDuringPregnancy', 'deniedPublicServices', 'noAccessToSuppportNetwork', 'perpetratorIsCriminal', 'perpetratorIsImprisoned', 'feelsIsolated', 'trustedPeopleAccess', 'otherRisks', 'neededMedicalAttention');

-- CreateEnum
CREATE TYPE "msr"."monthly_income" AS ENUM ('yes', 'no', 'noAccess');

-- CreateEnum
CREATE TYPE "msr"."work_situation" AS ENUM ('employedClt', 'employedPj', 'student', 'studentWithIncome', 'retired', 'unemployed');

-- CreateEnum
CREATE TYPE "msr"."financial_dependents" AS ENUM ('yes', 'no');

-- CreateEnum
CREATE TYPE "msr"."family_income_responsibility" AS ENUM ('yes', 'no');

-- CreateEnum
CREATE TYPE "msr"."property_ownership" AS ENUM ('yes', 'no');

-- AlterTable
ALTER TABLE "msr"."msr_socioeconomic_data" DROP COLUMN "has_monthly_income",
ADD COLUMN     "has_monthly_income" "msr"."monthly_income",
DROP COLUMN "work_situation",
ADD COLUMN     "work_situation" "msr"."work_situation",
DROP COLUMN "has_financial_dependents",
ADD COLUMN     "has_financial_dependents" "msr"."financial_dependents",
DROP COLUMN "family_income_responsibility",
ADD COLUMN     "family_income_responsibility" "msr"."family_income_responsibility",
DROP COLUMN "owns_property",
ADD COLUMN     "owns_property" "msr"."property_ownership";

-- AlterTable
ALTER TABLE "msr"."msr_violence_history" DROP COLUMN "violence_types",
ADD COLUMN     "violence_types" "msr"."violence_type"[],
DROP COLUMN "violence_period",
ADD COLUMN     "violence_period" "msr"."violence_period",
DROP COLUMN "violence_author_gender",
ADD COLUMN     "violence_author_gender" "msr"."perpetrator_gender",
DROP COLUMN "violence_author_relationship",
ADD COLUMN     "violence_author_relationship" "msr"."perpetrator_relationship",
DROP COLUMN "violence_location",
ADD COLUMN     "violence_location" "msr"."violence_location"[],
DROP COLUMN "legal_actions_taken",
ADD COLUMN     "legal_actions_taken" "msr"."legal_action"[],
DROP COLUMN "police_report_difficulty",
ADD COLUMN     "police_report_difficulty" "msr"."police_report_difficulty",
DROP COLUMN "protective_factors",
ADD COLUMN     "protective_factors" "msr"."protective_factor"[],
DROP COLUMN "risk_factors",
ADD COLUMN     "risk_factors" "msr"."risk_factor"[];

-- CreateIndex
CREATE UNIQUE INDEX "msr_violence_history_msr_id_key" ON "msr"."msr_violence_history"("msr_id");
