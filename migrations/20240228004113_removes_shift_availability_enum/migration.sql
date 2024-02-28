/*
  Warnings:

  - The `shift_availability` column on the `multipliers` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "mobilization"."multipliers" DROP COLUMN "shift_availability",
ADD COLUMN     "shift_availability" TEXT[];

-- DropEnum
DROP TYPE "mobilization"."multiplier_shift_availability";
