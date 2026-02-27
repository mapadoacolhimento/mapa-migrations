-- CreateEnum
CREATE TYPE "survey"."instrumental_type" AS ENUM ('quality_of_life_d0', 'quality_of_life_d90', 'quality_of_life_d180', 'quality_of_life_d270', 'psychological_support_evaluation', 'legal_support_evaluation', 'msr_psychological_support_conclusion', 'msr_legal_support_conclusion', 'psychological_support_follow_up_i', 'psychological_support_follow_up_ii', 'legal_support_follow_up_i', 'legal_support_follow_up_ii', 'volunteer_psychological_support_conclusion', 'volunteer_legal_support_conclusion', 'support_interruption');

-- CreateEnum
CREATE TYPE "survey"."instrumental_status" AS ENUM ('sent', 'answered');

-- CreateTable
CREATE TABLE "survey"."msr_instrumental_record" (
    "msr_instrumental_record_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "instrumental_type" "survey"."instrumental_type" NOT NULL,
    "status" "survey"."instrumental_status" NOT NULL DEFAULT 'sent',
    "answer_id" INTEGER,
    "sent_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "answered_at" TIMESTAMP(6),
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "msr_instrumental_record_pkey" PRIMARY KEY ("msr_instrumental_record_id")
);

-- CreateTable
CREATE TABLE "survey"."volunteer_instrumental_record" (
    "volunteer_instrumental_record_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "volunteer_id" INTEGER NOT NULL,
    "instrumental_type" "survey"."instrumental_type" NOT NULL,
    "status" "survey"."instrumental_status" NOT NULL DEFAULT 'sent',
    "answer_id" INTEGER,
    "sent_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "answered_at" TIMESTAMP(6),
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "volunteer_instrumental_record_pkey" PRIMARY KEY ("volunteer_instrumental_record_id")
);

-- AddForeignKey
ALTER TABLE "survey"."msr_instrumental_record" ADD CONSTRAINT "msr_instrumental_record_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."volunteer_instrumental_record" ADD CONSTRAINT "volunteer_instrumental_record_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."volunteer_instrumental_record" ADD CONSTRAINT "volunteer_instrumental_record_volunteer_id_fkey" FOREIGN KEY ("volunteer_id") REFERENCES "public"."volunteers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
