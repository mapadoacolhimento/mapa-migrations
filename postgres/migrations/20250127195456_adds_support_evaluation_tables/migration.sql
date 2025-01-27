-- CreateTable
CREATE TABLE "survey"."psychological_support_evaluation" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "had_to_pay_for_support" TEXT NOT NULL,
    "is_strategy_useful" TEXT NOT NULL,
    "handle_stress_anxiety" TEXT NOT NULL,
    "satisfaction_level" TEXT NOT NULL,
    "expectations_met" TEXT NOT NULL,
    "written_evaluation" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "psychological_support_evaluation_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."legal_support_evaluation" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "had_to_pay_for_support" TEXT NOT NULL,
    "has_received_clear_information" TEXT NOT NULL,
    "handle_stress_anxiety" TEXT NOT NULL,
    "case_progress" TEXT NOT NULL,
    "satisfaction_level" TEXT NOT NULL,
    "expectations_met" TEXT NOT NULL,
    "written_evaluation" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "legal_support_evaluation_pkey" PRIMARY KEY ("answer_id")
);

-- AddForeignKey
ALTER TABLE "survey"."psychological_support_evaluation" ADD CONSTRAINT "psychological_support_evaluation_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."legal_support_evaluation" ADD CONSTRAINT "legal_support_evaluation_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;
