-- CreateTable
CREATE TABLE "msr"."msr_status_history" (
    "msr_status_history_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "status" "msr"."msr_status" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "msr_status_history_pkey" PRIMARY KEY ("msr_status_history_id")
);

-- AddForeignKey
ALTER TABLE "msr"."msr_status_history" ADD CONSTRAINT "msr_status_history_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
