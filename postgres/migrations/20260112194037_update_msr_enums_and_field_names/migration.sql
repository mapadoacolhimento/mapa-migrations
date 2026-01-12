/*
  Warnings:

  - You are about to drop the column `family_income_responsibility` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - You are about to drop the column `owns_property` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - You are about to drop the column `work_situation` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - The `has_monthly_income` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `income_range` column on the `msr_socioeconomic_data` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `police_report` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `police_report_difficulty` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `police_report_difficulty_reason` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `resides_with_author` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_author_gender` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_author_relationship` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_description` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_period` on the `msr_violence_history` table. All the data in the column will be lost.
  - You are about to drop the column `violence_types` on the `msr_violence_history` table. All the data in the column will be lost.
  - The `violence_location` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `legal_actions_taken` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `protective_factors` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `risk_factors` column on the `msr_violence_history` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[msr_id]` on the table `msr_violence_history` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "msr"."violence_type" AS ENUM ('physical_violence', 'psychological_violence', 'sexual_violence', 'moral_violence', 'digital_violence', 'patrimonial_violence', 'obstetric_violence', 'threat', 'political_violence', 'no_violence');

-- CreateEnum
CREATE TYPE "msr"."violence_time" AS ENUM ('isolated_episode', 'last_week', 'less_than_3_months', 'between_3_months_and_1_year', 'between_1_and_3_years', 'between_3_and_6_years', 'between_6_and_10_years', 'more_than_10_years');

-- CreateEnum
CREATE TYPE "msr"."perpetrator_gender" AS ENUM ('woman', 'man', 'non_binary');

-- CreateEnum
CREATE TYPE "msr"."violence_perpetrator" AS ENUM ('nuclear_family', 'close_family', 'current_partner', 'ex_partner', 'work_colleague', 'other_people');

-- CreateEnum
CREATE TYPE "msr"."violence_location" AS ENUM ('home_space', 'public_space', 'work_space', 'internet_space');

-- CreateEnum
CREATE TYPE "msr"."legal_action" AS ENUM ('physical_examination', 'police_inquiry', 'criminal_case', 'civil_case', 'labour_case', 'police_report', 'protective_measure', 'none_taken');

-- CreateEnum
CREATE TYPE "msr"."legal_action_difficulty" AS ENUM ('discouraged', 'not_competent', 'refused_to_register', 'no_access_to_justice', 'denied_restraining_order', 'not_applicable');

-- CreateEnum
CREATE TYPE "msr"."protective_factor" AS ENUM ('support_network', 'dont_live_with_perpetrator', 'feels_safe', 'is_not_dependant', 'has_qualified_public_services');

-- CreateEnum
CREATE TYPE "msr"."risk_factor" AS ENUM ('gun_access', 'private_captivity', 'violence_during_pregnancy', 'denied_public_services', 'no_support_network', 'perpetrator_is_a_criminal', 'perpetrator_is_imprisoned', 'feels_isolated', 'other_risks', 'needed_medical_attention');

-- CreateEnum
CREATE TYPE "msr"."monthly_income" AS ENUM ('yes', 'no', 'no_access');

-- CreateEnum
CREATE TYPE "msr"."income_range" AS ENUM ('no_income', 'half_minimum_wage', 'up_to_one_minimum_wage', 'up_to_two_minimum_wages', 'up_to_three_minimum_wages', 'up_to_four_minimum_wages', 'five_minimum_wages_or_more');

-- CreateEnum
CREATE TYPE "msr"."employment_status" AS ENUM ('employed_clt', 'employed_pj', 'student', 'student_with_income', 'retired', 'unemployed');

-- CreateEnum
CREATE TYPE "msr"."family_provider" AS ENUM ('yes', 'no', 'shared_responsibility');

-- AlterTable
ALTER TABLE "msr"."msr_socioeconomic_data" DROP COLUMN "family_income_responsibility",
DROP COLUMN "owns_property",
DROP COLUMN "work_situation",
ADD COLUMN     "employment_status" "msr"."employment_status",
ADD COLUMN     "family_provider" "msr"."family_provider",
ADD COLUMN     "property_ownership" BOOLEAN,
DROP COLUMN "has_monthly_income",
ADD COLUMN     "has_monthly_income" "msr"."monthly_income",
DROP COLUMN "income_range",
ADD COLUMN     "income_range" "msr"."income_range";

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
ADD COLUMN     "violence_type" "msr"."violence_type"[],
DROP COLUMN "violence_location",
ADD COLUMN     "violence_location" "msr"."violence_location"[],
DROP COLUMN "legal_actions_taken",
ADD COLUMN     "legal_actions_taken" "msr"."legal_action"[],
DROP COLUMN "protective_factors",
ADD COLUMN     "protective_factors" "msr"."protective_factor"[],
DROP COLUMN "risk_factors",
ADD COLUMN     "risk_factors" "msr"."risk_factor"[];

-- CreateIndex
CREATE UNIQUE INDEX "msr_violence_history_msr_id_key" ON "msr"."msr_violence_history"("msr_id");
