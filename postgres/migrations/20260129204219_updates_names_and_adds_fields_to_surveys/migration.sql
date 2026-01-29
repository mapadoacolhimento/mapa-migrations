/*
  Warnings:

  - You are about to drop the column `income_range` on the `msr_socioeconomic_data` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "msr"."monthly_income_range" AS ENUM ('no_income', 'half_minimum_wage', 'up_to_one_minimum_wage', 'up_to_two_minimum_wages', 'up_to_three_minimum_wages', 'up_to_four_minimum_wages', 'five_minimum_wages_or_more');

-- AlterTable
ALTER TABLE "msr"."msr_socioeconomic_data" DROP COLUMN "income_range",
ADD COLUMN     "monthly_income_range" "msr"."monthly_income_range";

-- AlterTable
ALTER TABLE "survey"."legal_support_evaluation" ADD COLUMN     "agreements_fulfilled" TEXT,
ADD COLUMN     "is_receiving_service" TEXT;

-- AlterTable
ALTER TABLE "survey"."psychological_support_evaluation" ADD COLUMN     "agreements_fulfilled" TEXT,
ADD COLUMN     "has_helped_with_questions" TEXT,
ADD COLUMN     "is_receiving_service" TEXT;

-- DropEnum
DROP TYPE "msr"."income_range";
