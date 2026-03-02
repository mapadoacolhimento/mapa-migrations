-- DropForeignKey
ALTER TABLE "survey"."msr_instrumental_record" DROP CONSTRAINT "msr_instrumental_record_match_id_fkey";

-- AddForeignKey
ALTER TABLE "survey"."msr_instrumental_record" ADD CONSTRAINT "msr_instrumental_record_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE SET NULL ON UPDATE CASCADE;
