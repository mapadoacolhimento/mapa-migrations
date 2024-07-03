-- AlterTable
ALTER TABLE "pii_mask"."msr_pii" ALTER COLUMN "date_of_birth" DROP NOT NULL;

-- AlterTable
ALTER TABLE "pii_sec"."msr_pii" ALTER COLUMN "date_of_birth" DROP NOT NULL;
