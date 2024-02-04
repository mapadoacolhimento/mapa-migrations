-- CreateEnum
CREATE TYPE "match"."support_requests_status" AS ENUM ('open', 'matched', 'social_assistant', 'public_service', 'duplicated', 'closed', 'special_case');

-- CreateEnum
CREATE TYPE "match"."match_type" AS ENUM ('msr', 'volunteer', 'manual', 'old');

-- CreateEnum
CREATE TYPE "match"."match_stage" AS ENUM ('ideal', 'expanded', 'online', 'old', 'manual');

-- CreateEnum
CREATE TYPE "match"."match_status" AS ENUM ('completed', 'expired', 'in_contact', 'interrupted_after_support', 'interrupted_before_support', 'waiting_contact');

-- CreateEnum
CREATE TYPE "match"."survey_type" AS ENUM ('triagem_1', 'triagem_2', 'acompanhamento_1', 'acompanhamento_2');

-- CreateTable
CREATE TABLE "match"."match_status_history" (
    "match_status_history_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "status" "match"."match_status" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "match_status_history_pkey" PRIMARY KEY ("match_status_history_id")
);

-- CreateTable
CREATE TABLE "match"."match_surveys" (
    "match_survey_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "survey_type" "match"."survey_type" NOT NULL,

    CONSTRAINT "match_surveys_pkey" PRIMARY KEY ("match_survey_id")
);

-- CreateTable
CREATE TABLE "match"."matches" (
    "match_id" SERIAL NOT NULL,
    "support_request_id" INTEGER NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "volunteer_id" INTEGER,
    "msr_zendesk_ticket_id" BIGINT NOT NULL,
    "volunteer_zendesk_ticket_id" BIGINT,
    "support_type" "match"."support_type" NOT NULL,
    "match_type" "match"."match_type" NOT NULL,
    "match_stage" "match"."match_stage" NOT NULL,
    "status" "match"."match_status" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "matches_pkey" PRIMARY KEY ("match_id")
);

-- CreateTable
CREATE TABLE "match"."support_request_status_history" (
    "support_request_status_history_id" SERIAL NOT NULL,
    "support_request_id" INTEGER NOT NULL,
    "status" "match"."support_requests_status" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "support_request_status_history_pkey" PRIMARY KEY ("support_request_status_history_id")
);

-- CreateTable
CREATE TABLE "match"."support_requests" (
    "support_request_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "zendesk_ticket_id" BIGINT NOT NULL,
    "support_type" "match"."support_type" NOT NULL,
    "support_expertise" TEXT,
    "priority" INTEGER,
    "has_disability" BOOLEAN,
    "requires_libras" BOOLEAN,
    "accepts_online_support" BOOLEAN NOT NULL,
    "lat" DECIMAL(10,4),
    "lng" DECIMAL(10,4),
    "city" TEXT,
    "state" TEXT,
    "status" "match"."support_requests_status" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "support_requests_pkey" PRIMARY KEY ("support_request_id")
);

-- CreateTable
CREATE TABLE "public"."feature_flag" (
    "id" BIGSERIAL NOT NULL,
    "feature_enabled" BOOLEAN NOT NULL DEFAULT false,
    "feature_name" TEXT NOT NULL,

    CONSTRAINT "feature_flag_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "support_requests_zendesk_ticket_id_key" ON "match"."support_requests"("zendesk_ticket_id");

-- CreateIndex
CREATE UNIQUE INDEX "feature_flag_feature_name_key" ON "public"."feature_flag"("feature_name");

-- AddForeignKey
ALTER TABLE "match"."match_status_history" ADD CONSTRAINT "match_status_history_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match"."match_surveys" ADD CONSTRAINT "match_surveys_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match"."matches" ADD CONSTRAINT "matches_support_request_id_fkey" FOREIGN KEY ("support_request_id") REFERENCES "match"."support_requests"("support_request_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match"."matches" ADD CONSTRAINT "matches_volunteer_id_fkey" FOREIGN KEY ("volunteer_id") REFERENCES "public"."volunteers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match"."support_request_status_history" ADD CONSTRAINT "support_request_status_history_support_request_id_fkey" FOREIGN KEY ("support_request_id") REFERENCES "match"."support_requests"("support_request_id") ON DELETE RESTRICT ON UPDATE CASCADE;
