-- CreateTable
CREATE TABLE "match"."busara_ab_experiment" (
    "busara_ab_experiment_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "support_request_id" INTEGER NOT NULL,
    "msr_id" BIGINT NOT NULL,
    "transactional_id" VARCHAR(50) NOT NULL,

    CONSTRAINT "busara_ab_experiment_pkey" PRIMARY KEY ("busara_ab_experiment_id")
);
