-- AddForeignKey
ALTER TABLE "mobilization"."multiplier_journey_events" ADD CONSTRAINT "multiplier_journey_events_multiplier_id_fkey" FOREIGN KEY ("multiplier_id") REFERENCES "mobilization"."multipliers"("multiplier_id") ON DELETE RESTRICT ON UPDATE CASCADE;
