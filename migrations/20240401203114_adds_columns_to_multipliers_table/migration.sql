-- CreateEnum
CREATE TYPE "mobilization"."multiplier_household_type" AS ENUM ('urban', 'rural', 'not_found');

-- AlterTable
ALTER TABLE "mobilization"."multipliers" ADD COLUMN     "city" VARCHAR(100) NOT NULL DEFAULT 'not_found',
ADD COLUMN     "disability_type" TEXT[],
ADD COLUMN     "has_children" BOOLEAN,
ADD COLUMN     "household_type" "mobilization"."multiplier_household_type" NOT NULL DEFAULT 'not_found',
ADD COLUMN     "how_many_children" INTEGER;
