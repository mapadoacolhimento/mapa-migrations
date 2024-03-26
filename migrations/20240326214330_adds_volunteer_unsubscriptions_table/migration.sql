-- AlterTable
ALTER TABLE "public"."volunteer_segments" ALTER COLUMN "created_at" SET DATA TYPE TIMESTAMP(6),
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "updated_at" SET DATA TYPE TIMESTAMP(6);

-- CreateTable
CREATE TABLE "public"."volunteer_unsubscriptions" (
    "volunteer_unsubscription_id" BIGSERIAL NOT NULL,
    "volunteer_id" INTEGER NOT NULL,
    "unsubscription_reason" VARCHAR NOT NULL,
    "unsubscription_description" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "volunteer_unsubscriptions_pkey" PRIMARY KEY ("volunteer_unsubscription_id")
);

-- AddForeignKey
ALTER TABLE "public"."volunteer_unsubscriptions" ADD CONSTRAINT "volunteer_unsubscriptions_volunteer_id_fkey" FOREIGN KEY ("volunteer_id") REFERENCES "public"."volunteers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
