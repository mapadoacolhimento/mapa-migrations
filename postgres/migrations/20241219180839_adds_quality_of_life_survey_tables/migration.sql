-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "survey";

-- CreateTable
CREATE TABLE "survey"."survey_quality_of_life_d0" (
    "answer_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "quality_of_life" TEXT NOT NULL,
    "security" TEXT NOT NULL,
    "controlling_situations" TEXT NOT NULL,
    "self_esteem" TEXT NOT NULL,
    "feelings" TEXT NOT NULL,
    "handle_violence_impact" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "survey_quality_of_life_d0_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."survey_quality_of_life_d90" (
    "answer_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "quality_of_life" TEXT NOT NULL,
    "security" TEXT NOT NULL,
    "controlling_situations" TEXT NOT NULL,
    "self_esteem" TEXT NOT NULL,
    "feelings" TEXT NOT NULL,
    "handle_violence_impact" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "survey_quality_of_life_d90_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."survey_quality_of_life_d180" (
    "answer_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "quality_of_life" TEXT NOT NULL,
    "security" TEXT NOT NULL,
    "controlling_situations" TEXT NOT NULL,
    "self_esteem" TEXT NOT NULL,
    "feelings" TEXT NOT NULL,
    "handle_violence_impact" TEXT NOT NULL,
    "substance_use" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "survey_quality_of_life_d180_pkey" PRIMARY KEY ("answer_id")
);

-- AddForeignKey
ALTER TABLE "survey"."survey_quality_of_life_d0" ADD CONSTRAINT "survey_quality_of_life_d0_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."survey_quality_of_life_d90" ADD CONSTRAINT "survey_quality_of_life_d90_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."survey_quality_of_life_d180" ADD CONSTRAINT "survey_quality_of_life_d180_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
