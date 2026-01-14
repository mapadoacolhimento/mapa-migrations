/*
  Warnings:

  - You are about to drop the column `family_income_responsibility` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - You are about to drop the column `owns_property` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - You are about to drop the column `work_situation` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - The `has_monthly_income` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `has_financial_dependents` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `police_report` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `police_report_difficulty` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `police_report_difficulty_reason` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `resides_with_author` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_author_gender` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_author_relationship` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_description` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_period` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_types` on the `msr_violence_history` table. All the data in the column will be lost.
  - The `legal_actions_taken` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `protective_factors` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `risk_factors` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "msr"."violence_time" AS ENUM ('isolatedEpisode', 'lastWeek', 'threeMonths', 'moreThanThreeMonths', 'moreThanAYear', 'moreThanThreeYears', 'moreThanSixYears', 'moreThanTenYears');

-- CreateEnum
CREATE TYPE "msr"."violence_perpetrator" AS ENUM ('nuclearFamily', 'closeFamily', 'currentPartner', 'formerPartner', 'workColleague', 'otherPeople');

-- CreateEnum
CREATE TYPE "msr"."legal_action_difficulty" AS ENUM ('no', 'discourageReporting', 'notTheirCompetence', 'refusedToReport', 'others', 'n_a');

-- CreateEnum
CREATE TYPE "msr"."legal_actions_taken" AS ENUM ('physicalExamination', 'policeInquiry', 'criminalCase', 'civilCase', 'labourCase', 'noneTaken');

-- CreateEnum
CREATE TYPE "msr"."protective_factors" AS ENUM ('supportNetwork', 'dontLiveWithPerpetrator', 'fellsSafe', 'isNotDependant', 'n_a');

-- CreateEnum
CREATE TYPE "msr"."risk_factors" AS ENUM ('gunAccess', 'imprisonment', 'violenceDuringPregnancy', 'deniedPublicServices', 'noAccessToSuppportNetwork', 'perpetratorIsCriminal', 'perpetratorIsImprisoned', 'feelsIsolated', 'trustedPeopleAccess', 'otherRisks', 'neededMedicalAttention');

-- CreateEnum
CREATE TYPE "msr"."has_monthly_income" AS ENUM ('yes', 'no', 'noAccess');

-- CreateEnum
CREATE TYPE "msr"."employment_status" AS ENUM ('employedClt', 'employedPj', 'student', 'studentWithIncome', 'retired', 'unemployed');

-- AlterTable
ALTER TABLE "msr"."msr_socioeconomic_data" DROP COLUMN "family_income_responsibility",
DROP COLUMN "owns_property",
DROP COLUMN "work_situation",
ADD COLUMN     "employment_status" "msr"."employment_status",
ADD COLUMN     "family_provider" BOOLEAN,
ADD COLUMN     "property_ownership" BOOLEAN,
DROP COLUMN "has_monthly_income",
ADD COLUMN     "has_monthly_income" "msr"."has_monthly_income",
DROP COLUMN "has_financial_dependents",
ADD COLUMN     "has_financial_dependents" BOOLEAN;

-- AlterTable
ALTER TABLE "msr"."msr_violence_history" DROP COLUMN "police_report",
DROP COLUMN "police_report_difficulty",
DROP COLUMN "police_report_difficulty_reason",
DROP COLUMN "resides_with_author",
DROP COLUMN "violence_author_gender",
DROP COLUMN "violence_author_relationship",
DROP COLUMN "violence_description",
DROP COLUMN "violence_period",
DROP COLUMN "violence_types",
ADD COLUMN     "legal_action_difficulty" "msr"."legal_action_difficulty",
ADD COLUMN     "lives_with_perpetrator" BOOLEAN,
ADD COLUMN     "perpetrator_gender" "msr"."perpetrator_gender",
ADD COLUMN     "violence_perpetrator" "msr"."violence_perpetrator",
ADD COLUMN     "violence_time" "msr"."violence_time",
ADD COLUMN     "violence_type" "msr"."violence_type"[],
DROP COLUMN "legal_actions_taken",
ADD COLUMN     "legal_actions_taken" "msr"."legal_actions_taken"[],
DROP COLUMN "protective_factors",
ADD COLUMN     "protective_factors" "msr"."protective_factors"[],
DROP COLUMN "risk_factors",
ADD COLUMN     "risk_factors" "msr"."risk_factors"[];

-- DropEnum
DROP TYPE "msr"."family_income_responsibility";

-- DropEnum
DROP TYPE "msr"."financial_dependents";

-- DropEnum
DROP TYPE "msr"."legal_action";

-- DropEnum
DROP TYPE "msr"."monthly_income";

-- DropEnum
DROP TYPE "msr"."perpetrator_relationship";

-- DropEnum
DROP TYPE "msr"."police_report_difficulty";

-- DropEnum
DROP TYPE "msr"."property_ownership";

-- DropEnum
DROP TYPE "msr"."protective_factor";

-- DropEnum
DROP TYPE "msr"."risk_factor";

-- DropEnum
DROP TYPE "msr"."violence_period";

-- DropEnum
DROP TYPE "msr"."work_situation";
