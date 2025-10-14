-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "legacy_support_assessments";

-- CreateTable
CREATE TABLE "legacy_support_assessments"."mda_forms_answers" (
    "id" SERIAL NOT NULL,
    "form" VARCHAR(30) NOT NULL,
    "form_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "organization_id" BIGINT,
    "volunteer_email" VARCHAR(254) NOT NULL,
    "msr_name" VARCHAR(200) NOT NULL,
    "ticket_id" INTEGER,
    "answers" JSONB,

    CONSTRAINT "mda_forms_answers_pk" PRIMARY KEY ("id")
);
