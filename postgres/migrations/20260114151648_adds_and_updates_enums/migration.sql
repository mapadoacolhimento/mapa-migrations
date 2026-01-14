/*
  Warnings:

  - The values [employedClt,employedPj,studentWithIncome] on the enum `employment_status` will be removed. If these variants are still used in the database, this will fail.
  - The values [noAccess] on the enum `has_monthly_income` will be removed. If these variants are still used in the database, this will fail.
  - The values [no,discourageReporting,notTheirCompetence,refusedToReport,others,n_a] on the enum `legal_action_difficulty` will be removed. If these variants are still used in the database, this will fail.
  - The values [physicalExamination,policeInquiry,criminalCase,civilCase,labourCase,noneTaken] on the enum `legal_actions_taken` will be removed. If these variants are still used in the database, this will fail.
  - The values [supportNetwork,dontLiveWithPerpetrator,fellsSafe,isNotDependant,n_a] on the enum `protective_factors` will be removed. If these variants are still used in the database, this will fail.
  - The values [gunAccess,imprisonment,violenceDuringPregnancy,deniedPublicServices,noAccessToSuppportNetwork,perpetratorIsCriminal,perpetratorIsImprisoned,feelsIsolated,trustedPeopleAccess,otherRisks,neededMedicalAttention] on the enum `risk_factors` will be removed. If these variants are still used in the database, this will fail.
  - The values [homeSpace,publicSpace,workSpace,internetSpace] on the enum `violence_location` will be removed. If these variants are still used in the database, this will fail.
  - The values [nuclearFamily,closeFamily,currentPartner,formerPartner,workColleague,otherPeople] on the enum `violence_perpetrator` will be removed. If these variants are still used in the database, this will fail.
  - The values [isolatedEpisode,lastWeek,threeMonths,moreThanThreeMonths,moreThanAYear,moreThanThreeYears,moreThanSixYears,moreThanTenYears] on the enum `violence_time` will be removed. If these variants are still used in the database, this will fail.
  - The values [physicalViolence,psychologicalViolence,sexualViolence,digitalViolence,patrimonialViolence,obstetricViolence,politicalViolence,noViolence] on the enum `violence_type` will be removed. If these variants are still used in the database, this will fail.
  - The `income_range` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `family_provider` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "msr"."income_range" AS ENUM ('no_income', 'half_minimum_wage', 'up_to_one_minimum_wage', 'up_to_two_minimum_wages', 'up_to_three_minimum_wages', 'up_to_four_minimum_wages', 'five_minimum_wages_or_more');

-- CreateEnum
CREATE TYPE "msr"."family_provider" AS ENUM ('yes', 'no', 'shared_responsibility');

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."employment_status_new" AS ENUM ('employed_clt', 'employed_pj', 'student', 'student_with_income', 'retired', 'unemployed');
ALTER TABLE "msr"."msr_socioeconomic_data" ALTER COLUMN "employment_status" TYPE "msr"."employment_status_new" USING ("employment_status"::text::"msr"."employment_status_new");
ALTER TYPE "msr"."employment_status" RENAME TO "employment_status_old";
ALTER TYPE "msr"."employment_status_new" RENAME TO "employment_status";
DROP TYPE "msr"."employment_status_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."has_monthly_income_new" AS ENUM ('yes', 'no', 'no_access');
ALTER TABLE "msr"."msr_socioeconomic_data" ALTER COLUMN "has_monthly_income" TYPE "msr"."has_monthly_income_new" USING ("has_monthly_income"::text::"msr"."has_monthly_income_new");
ALTER TYPE "msr"."has_monthly_income" RENAME TO "has_monthly_income_old";
ALTER TYPE "msr"."has_monthly_income_new" RENAME TO "has_monthly_income";
DROP TYPE "msr"."has_monthly_income_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."legal_action_difficulty_new" AS ENUM ('discouraged', 'not_competent', 'refused_to_register', 'no_access_to_justice', 'denied_restraining_order', 'not_applicable');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "legal_action_difficulty" TYPE "msr"."legal_action_difficulty_new" USING ("legal_action_difficulty"::text::"msr"."legal_action_difficulty_new");
ALTER TYPE "msr"."legal_action_difficulty" RENAME TO "legal_action_difficulty_old";
ALTER TYPE "msr"."legal_action_difficulty_new" RENAME TO "legal_action_difficulty";
DROP TYPE "msr"."legal_action_difficulty_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."legal_actions_taken_new" AS ENUM ('physical_examination', 'police_inquiry', 'criminal_case', 'civil_case', 'labour_case', 'police_report', 'protective_measure', 'none_taken');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "legal_actions_taken" TYPE "msr"."legal_actions_taken_new"[] USING ("legal_actions_taken"::text::"msr"."legal_actions_taken_new"[]);
ALTER TYPE "msr"."legal_actions_taken" RENAME TO "legal_actions_taken_old";
ALTER TYPE "msr"."legal_actions_taken_new" RENAME TO "legal_actions_taken";
DROP TYPE "msr"."legal_actions_taken_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."protective_factors_new" AS ENUM ('support_network', 'dont_live_with_perpetrator', 'feels_safe', 'is_not_dependant', 'has_qualified_public_services');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "protective_factors" TYPE "msr"."protective_factors_new"[] USING ("protective_factors"::text::"msr"."protective_factors_new"[]);
ALTER TYPE "msr"."protective_factors" RENAME TO "protective_factors_old";
ALTER TYPE "msr"."protective_factors_new" RENAME TO "protective_factors";
DROP TYPE "msr"."protective_factors_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."risk_factors_new" AS ENUM ('gun_access', 'private_captivity', 'violence_during_pregnancy', 'denied_public_services', 'no_support_network', 'perpetrator_is_a_criminal', 'perpetrator_is_imprisoned', 'feels_isolated', 'other_risks', 'needed_medical_attention');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "risk_factors" TYPE "msr"."risk_factors_new"[] USING ("risk_factors"::text::"msr"."risk_factors_new"[]);
ALTER TYPE "msr"."risk_factors" RENAME TO "risk_factors_old";
ALTER TYPE "msr"."risk_factors_new" RENAME TO "risk_factors";
DROP TYPE "msr"."risk_factors_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."violence_location_new" AS ENUM ('home_space', 'public_space', 'work_space', 'internet_space');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "violence_location" TYPE "msr"."violence_location_new"[] USING ("violence_location"::text::"msr"."violence_location_new"[]);
ALTER TYPE "msr"."violence_location" RENAME TO "violence_location_old";
ALTER TYPE "msr"."violence_location_new" RENAME TO "violence_location";
DROP TYPE "msr"."violence_location_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."violence_perpetrator_new" AS ENUM ('nuclear_family', 'close_family', 'current_partner', 'ex_partner', 'work_colleague', 'other_people');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "violence_perpetrator" TYPE "msr"."violence_perpetrator_new" USING ("violence_perpetrator"::text::"msr"."violence_perpetrator_new");
ALTER TYPE "msr"."violence_perpetrator" RENAME TO "violence_perpetrator_old";
ALTER TYPE "msr"."violence_perpetrator_new" RENAME TO "violence_perpetrator";
DROP TYPE "msr"."violence_perpetrator_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."violence_time_new" AS ENUM ('isolated_episode', 'last_week', 'less_than_3_months', 'between_3_months_and_1_year', 'between_1_and_3_years', 'between_3_and_6_years', 'between_6_and_10_years', 'more_than_10_years');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "violence_time" TYPE "msr"."violence_time_new" USING ("violence_time"::text::"msr"."violence_time_new");
ALTER TYPE "msr"."violence_time" RENAME TO "violence_time_old";
ALTER TYPE "msr"."violence_time_new" RENAME TO "violence_time";
DROP TYPE "msr"."violence_time_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."violence_type_new" AS ENUM ('physical_violence', 'psychological_violence', 'sexual_violence', 'moral_violence', 'digital_violence', 'patrimonial_violence', 'obstetric_violence', 'threat', 'political_violence', 'no_violence');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "violence_type" TYPE "msr"."violence_type_new"[] USING ("violence_type"::text::"msr"."violence_type_new"[]);
ALTER TYPE "msr"."violence_type" RENAME TO "violence_type_old";
ALTER TYPE "msr"."violence_type_new" RENAME TO "violence_type";
DROP TYPE "msr"."violence_type_old";
COMMIT;

-- AlterTable
ALTER TABLE "msr"."msr_socioeconomic_data" DROP COLUMN "income_range",
ADD COLUMN     "income_range" "msr"."income_range",
DROP COLUMN "family_provider",
ADD COLUMN     "family_provider" "msr"."family_provider";
