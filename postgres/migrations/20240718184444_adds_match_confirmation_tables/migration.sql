-- CreateEnum
CREATE TYPE "match"."match_confirmation_status" AS ENUM ('waiting', 'confirmed', 'denied', 'failed');

-- CreateTable
CREATE TABLE "match"."match_confirmations" (
    "match_confirmation_id" SERIAL NOT NULL,
    "support_request_id" INTEGER NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "volunteer_id" INTEGER,
    "status" "match"."match_confirmation_status" NOT NULL,
    "match_id" INTEGER,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "match_confirmations_pkey" PRIMARY KEY ("match_confirmation_id")
);

-- CreateTable
CREATE TABLE "match"."match_confirmation_status_history" (
    "match_confirmation_status_history_id" SERIAL NOT NULL,
    "match_confirmation_id" INTEGER NOT NULL,
    "status" "match"."match_confirmation_status" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "match_confirmation_status_history_pkey" PRIMARY KEY ("match_confirmation_status_history_id")
);

-- AddForeignKey
ALTER TABLE "match"."match_confirmations" ADD CONSTRAINT "match_confirmations_support_request_id_fkey" FOREIGN KEY ("support_request_id") REFERENCES "match"."support_requests"("support_request_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match"."match_confirmation_status_history" ADD CONSTRAINT "match_confirmation_status_history_match_confirmation_id_fkey" FOREIGN KEY ("match_confirmation_id") REFERENCES "match"."match_confirmations"("match_confirmation_id") ON DELETE RESTRICT ON UPDATE CASCADE;
