/*
  Warnings:

  - You are about to drop the `MSRs` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "pii_mask"."msr_pii" DROP CONSTRAINT "msr_pii_msr_id_fkey";

-- DropForeignKey
ALTER TABLE "pii_sec"."msr_pii" DROP CONSTRAINT "msr_pii_msr_id_fkey";

-- DropTable
DROP TABLE "msr"."MSRs";

-- CreateTable
CREATE TABLE "msr"."msrs" (
    "msr_id" BIGSERIAL NOT NULL,
    "zendesk_user_id" BIGINT NOT NULL,
    "gender" "public"."gender" NOT NULL,
    "race_color" "public"."race" NOT NULL,
    "has_disability" BOOLEAN,
    "accepts_online_support" BOOLEAN,
    "zipcode" VARCHAR(9) NOT NULL,
    "neighborhood" VARCHAR(100) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "state" VARCHAR(9) NOT NULL,
    "status" "msr"."msr_status" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "msrs_pkey" PRIMARY KEY ("msr_id")
);

-- AddForeignKey
ALTER TABLE "pii_sec"."msr_pii" ADD CONSTRAINT "msr_pii_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pii_mask"."msr_pii" ADD CONSTRAINT "msr_pii_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
