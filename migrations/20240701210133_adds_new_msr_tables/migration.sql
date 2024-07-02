-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "msr";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "pii_mask";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "pii_sec";

-- CreateTable
CREATE TABLE "msr"."MSRs" (
    "msr_id" BIGSERIAL NOT NULL,
    "race_color" VARCHAR(100) NOT NULL,
    "zipcode" VARCHAR(9) NOT NULL,
    "neighborhood" VARCHAR(100) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "state" VARCHAR(9) NOT NULL,
    "status" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "MSRs_pkey" PRIMARY KEY ("msr_id")
);

-- CreateTable
CREATE TABLE "pii_sec"."msr_pii" (
    "msr_id" BIGSERIAL NOT NULL,
    "first_name" VARCHAR(200) NOT NULL,
    "last_name" VARCHAR(200) NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "phone" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "msr_pii_pkey" PRIMARY KEY ("msr_id")
);

-- CreateTable
CREATE TABLE "pii_mask"."msr_pii" (
    "msr_id" BIGSERIAL NOT NULL,
    "first_name" VARCHAR(1000) NOT NULL,
    "last_name" VARCHAR(1000) NOT NULL,
    "email" VARCHAR(1000) NOT NULL,
    "phone" VARCHAR(1000) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "msr_pii_pkey" PRIMARY KEY ("msr_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "msr_pii_email_key" ON "pii_sec"."msr_pii"("email");

-- AddForeignKey
ALTER TABLE "pii_sec"."msr_pii" ADD CONSTRAINT "msr_pii_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."MSRs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pii_mask"."msr_pii" ADD CONSTRAINT "msr_pii_msr_id_fkey" FOREIGN KEY ("msr_id") REFERENCES "msr"."MSRs"("msr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
