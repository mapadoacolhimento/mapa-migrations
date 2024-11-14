-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "iana";

-- CreateTable
CREATE TABLE "iana"."iana_feedback" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" BIGINT NOT NULL,
    "question" TEXT NOT NULL,
    "answer" TEXT,

    CONSTRAINT "iana_feedback_pkey" PRIMARY KEY ("id")
);
