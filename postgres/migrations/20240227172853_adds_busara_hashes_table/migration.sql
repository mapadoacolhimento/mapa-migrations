-- CreateTable
CREATE TABLE "match"."busara_hashes" (
    "msr_email" VARCHAR(254) NOT NULL,
    "hash" VARCHAR(1000) NOT NULL,

    CONSTRAINT "busara_hashes_pkey" PRIMARY KEY ("msr_email")
);
