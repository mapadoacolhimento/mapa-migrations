/*
  Warnings:

  - You are about to drop the column `income_range` on the `msr_socioeconomic_data` table. All the data in the column will be lost.
  - Added the required column `agreements_fulfilled` to the `legal_support_evaluation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `is_receiving_service` to the `legal_support_evaluation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `agreements_fulfilled` to the `psychological_support_evaluation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `has_helped_with_questions` to the `psychological_support_evaluation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `is_receiving_service` to the `psychological_support_evaluation` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "msr"."monthly_income_range" AS ENUM ('no_income', 'half_minimum_wage', 'up_to_one_minimum_wage', 'up_to_two_minimum_wages', 'up_to_three_minimum_wages', 'up_to_four_minimum_wages', 'five_minimum_wages_or_more');

-- AlterTable
ALTER TABLE "msr"."msr_socioeconomic_data" DROP COLUMN "income_range",
ADD COLUMN     "monthly_income_range" "msr"."monthly_income_range";

-- AlterTable
ALTER TABLE "survey"."legal_support_evaluation" ADD COLUMN     "agreements_fulfilled" TEXT NOT NULL,
ADD COLUMN     "is_receiving_service" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "survey"."psychological_support_evaluation" ADD COLUMN     "agreements_fulfilled" TEXT NOT NULL,
ADD COLUMN     "has_helped_with_questions" TEXT NOT NULL,
ADD COLUMN     "is_receiving_service" TEXT NOT NULL;

-- DropEnum
DROP TYPE "msr"."income_range";
