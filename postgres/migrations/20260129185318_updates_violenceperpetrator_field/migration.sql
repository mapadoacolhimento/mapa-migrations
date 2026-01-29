/*
  Warnings:

  - Changed the column `violence_perpetrator` on the `msr_violence_history` table from a scalar field to a list field. If there are non-null values in that column, this step will fail.

*/
-- AlterTable
ALTER TABLE "msr"."msr_violence_history" 
ALTER COLUMN "violence_perpetrator" 
SET DATA TYPE "msr"."violence_perpetrator"[]
USING CASE 
  WHEN "violence_perpetrator" IS NOT NULL 
  THEN ARRAY["violence_perpetrator"]::"msr"."violence_perpetrator"[]
  ELSE '{}'::"msr"."violence_perpetrator"[]
END;