-- AddForeignKey
ALTER TABLE "match"."support_requests" ADD CONSTRAINT "support_requests_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
