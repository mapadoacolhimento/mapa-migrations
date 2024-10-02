-- CreateEnum
CREATE TYPE "mobilization"."multiplier_journey_event" AS ENUM ('registration', 'general_onboarding');

-- CreateTable
CREATE TABLE "mobilization"."multiplier_journey_events" (
    "multiplier_journey_event_id" SERIAL NOT NULL,
    "multiplier_id" INTEGER NOT NULL,
    "event" "mobilization"."multiplier_journey_event" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "multiplier_journey_events_pkey" PRIMARY KEY ("multiplier_journey_event_id")
);
