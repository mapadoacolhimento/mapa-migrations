-- CreateTable
CREATE TABLE "msr"."msr_violence_history" (
    "msr_violence_history_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "violence_types" TEXT[],
    "violence_period" TEXT,
    "violence_occurred_in_brazil" BOOLEAN NOT NULL,
    "violence_author_gender" TEXT,
    "violence_author_relationship" TEXT,
    "resides_with_author" BOOLEAN,
    "violence_location" TEXT,
    "violence_description" TEXT,
    "legal_actions_taken" TEXT,
    "police_report" BOOLEAN,
    "police_report_difficulty" BOOLEAN,
    "police_report_difficulty_reason" TEXT,
    "protective_factors" TEXT,
    "risk_factors" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "msr_violence_history_pkey" PRIMARY KEY ("msr_violence_history_id")
);

-- CreateTable
CREATE TABLE "msr"."msr_socioeconomic_data" (
    "msr_socioeconomic_id" SERIAL NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "has_monthly_income" BOOLEAN,
    "income_range" TEXT,
    "work_situation" TEXT,
    "has_financial_dependents" BOOLEAN,
    "family_income_responsibility" TEXT,
    "owns_property" BOOLEAN,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "msr_socioeconomic_data_pkey" PRIMARY KEY ("msr_socioeconomic_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "msr_socioeconomic_data_msr_id_key" ON "msr"."msr_socioeconomic_data"("msr_id");

-- AddForeignKey
ALTER TABLE "msr"."msr_violence_history" ADD CONSTRAINT "msr_violence_history_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "msr"."msr_socioeconomic_data" ADD CONSTRAINT "msr_socioeconomic_data_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."msrs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
