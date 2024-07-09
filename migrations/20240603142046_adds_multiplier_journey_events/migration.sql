/*
  Warnings:

  - The values [registration,general_onboarding] on the enum `multiplier_journey_event` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "mobilization"."multiplier_journey_event_new" AS ENUM ('inscricao', 'embarque_geral', 'embarque_regional', 'i_encontro_da_rede', 'i_jornada_formativa', 'ii_jornada_formativa');
ALTER TABLE "mobilization"."multiplier_journey_events" ALTER COLUMN "event" TYPE "mobilization"."multiplier_journey_event_new" USING ("event"::text::"mobilization"."multiplier_journey_event_new");
ALTER TYPE "mobilization"."multiplier_journey_event" RENAME TO "multiplier_journey_event_old";
ALTER TYPE "mobilization"."multiplier_journey_event_new" RENAME TO "multiplier_journey_event";
DROP TYPE "mobilization"."multiplier_journey_event_old";
COMMIT;
