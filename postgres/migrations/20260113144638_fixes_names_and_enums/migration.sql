/*
  Warnings:

  - The values [physicalExamination,policeInquiry,criminalCase,civilCase,labourCase,noneTaken] on the enum `legal_action` will be removed. If these variants are still used in the database, this will fail.
  - The values [noAccess] on the enum `monthly_income` will be removed. If these variants are still used in the database, this will fail.
  - The values [supportNetwork,dontLiveWithPerpetrator,fellsSafe,isNotDependant,n_a] on the enum `protective_factor` will be removed. If these variants are still used in the database, this will fail.
  - The values [gunAccess,imprisonment,violenceDuringPregnancy,deniedPublicServices,noAccessToSuppportNetwork,perpetratorIsCriminal,perpetratorIsImprisoned,feelsIsolated,trustedPeopleAccess,otherRisks,neededMedicalAttention] on the enum `risk_factor` will be removed. If these variants are still used in the database, this will fail.
  - The values [homeSpace,publicSpace,workSpace,internetSpace] on the enum `violence_location` will be removed. If these variants are still used in the database, this will fail.
  - The values [physicalViolence,psychologicalViolence,sexualViolence,digitalViolence,patrimonialViolence,obstetricViolence,politicalViolence,noViolence] on the enum `violence_type` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `family_income_responsibility` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - You are about to drop the column `owns_property` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - You are about to drop the column `work_situation` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - The `income_range` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
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

*/
-- CreateEnum
CREATE TYPE "msr"."violence_time" AS ENUM ('isolated_episode', 'last_week', 'less_than_3_months', 'between_3_months_and_1_year', 'between_1_and_3_years', 'between_3_and_6_years', 'between_6_and_10_years', 'more_than_10_years');

-- CreateEnum
CREATE TYPE "msr"."violence_perpetrator" AS ENUM ('nuclear_family', 'close_family', 'current_partner', 'ex_partner', 'work_colleague', 'other_people');

-- CreateEnum
CREATE TYPE "msr"."legal_action_difficulty" AS ENUM ('discouraged', 'not_competent', 'refused_to_register', 'no_access_to_justice', 'denied_restraining_order', 'not_applicable');

-- CreateEnum
CREATE TYPE "msr"."income_range" AS ENUM ('no_income', 'half_minimum_wage', 'up_to_one_minimum_wage', 'up_to_two_minimum_wages', 'up_to_three_minimum_wages', 'up_to_four_minimum_wages', 'five_minimum_wages_or_more');

-- CreateEnum
CREATE TYPE "msr"."employment_status" AS ENUM ('employed_clt', 'employed_pj', 'student', 'student_with_income', 'retired', 'unemployed');

-- CreateEnum
CREATE TYPE "msr"."family_provider" AS ENUM ('yes', 'no', 'shared_responsibility');

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."legal_action_new" AS ENUM ('physical_examination', 'police_inquiry', 'criminal_case', 'civil_case', 'labour_case', 'police_report', 'protective_measure', 'none_taken');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "legal_actions_taken" TYPE "msr"."legal_action_new"[] USING ("legal_actions_taken"::text::"msr"."legal_action_new"[]);
ALTER TYPE "msr"."legal_action" RENAME TO "legal_action_old";
ALTER TYPE "msr"."legal_action_new" RENAME TO "legal_action";
DROP TYPE "msr"."legal_action_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."monthly_income_new" AS ENUM ('yes', 'no', 'no_access');
ALTER TABLE "msr"."msr_socioeconomic_data" ALTER COLUMN "has_monthly_income" TYPE "msr"."monthly_income_new" USING ("has_monthly_income"::text::"msr"."monthly_income_new");
ALTER TYPE "msr"."monthly_income" RENAME TO "monthly_income_old";
ALTER TYPE "msr"."monthly_income_new" RENAME TO "monthly_income";
DROP TYPE "msr"."monthly_income_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."protective_factor_new" AS ENUM ('support_network', 'dont_live_with_perpetrator', 'feels_safe', 'is_not_dependant', 'has_qualified_public_services');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "protective_factors" TYPE "msr"."protective_factor_new"[] USING ("protective_factors"::text::"msr"."protective_factor_new"[]);
ALTER TYPE "msr"."protective_factor" RENAME TO "protective_factor_old";
ALTER TYPE "msr"."protective_factor_new" RENAME TO "protective_factor";
DROP TYPE "msr"."protective_factor_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "msr"."risk_factor_new" AS ENUM ('gun_access', 'private_captivity', 'violence_during_pregnancy', 'denied_public_services', 'no_support_network', 'perpetrator_is_a_criminal', 'perpetrator_is_imprisoned', 'feels_isolated', 'other_risks', 'needed_medical_attention');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "risk_factors" TYPE "msr"."risk_factor_new"[] USING ("risk_factors"::text::"msr"."risk_factor_new"[]);
ALTER TYPE "msr"."risk_factor" RENAME TO "risk_factor_old";
ALTER TYPE "msr"."risk_factor_new" RENAME TO "risk_factor";
DROP TYPE "msr"."risk_factor_old";
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
CREATE TYPE "msr"."violence_type_new" AS ENUM ('physical_violence', 'psychological_violence', 'sexual_violence', 'moral_violence', 'digital_violence', 'patrimonial_violence', 'obstetric_violence', 'threat', 'political_violence', 'no_violence');
ALTER TABLE "msr"."msr_violence_history" ALTER COLUMN "violence_type" TYPE "msr"."violence_type_new"[] USING ("violence_type"::text::"msr"."violence_type_new"[]);
ALTER TYPE "msr"."violence_type" RENAME TO "violence_type_old";
ALTER TYPE "msr"."violence_type_new" RENAME TO "violence_type";
DROP TYPE "msr"."violence_type_old";
COMMIT;

-- AlterTable
ALTER TABLE "msr"."msr_socioeconomic_data" DROP COLUMN "family_income_responsibility",
DROP COLUMN "owns_property",
DROP COLUMN "work_situation",
ADD COLUMN     "employment_status" "msr"."employment_status",
ADD COLUMN     "family_provider" "msr"."family_provider",
ADD COLUMN     "property_ownership" BOOLEAN,
DROP COLUMN "income_range",
ADD COLUMN     "income_range" "msr"."income_range",
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
ADD COLUMN     "legal_action_difficulty" "msr"."legal_action_difficulty"[],
ADD COLUMN     "lives_with_perpetrator" BOOLEAN,
ADD COLUMN     "perpetrator_gender" "msr"."perpetrator_gender",
ADD COLUMN     "violence_perpetrator" "msr"."violence_perpetrator",
ADD COLUMN     "violence_time" "msr"."violence_time",
ADD COLUMN     "violence_type" "msr"."violence_type"[];

-- DropEnum
DROP TYPE "msr"."family_income_responsibility";

-- DropEnum
DROP TYPE "msr"."financial_dependents";

-- DropEnum
DROP TYPE "msr"."perpetrator_relationship";

-- DropEnum
DROP TYPE "msr"."police_report_difficulty";

-- DropEnum
DROP TYPE "msr"."property_ownership";

-- DropEnum
DROP TYPE "msr"."violence_period";

-- DropEnum
DROP TYPE "msr"."work_situation";
