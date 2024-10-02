-- CreateEnum
CREATE TYPE "public"."volunteer_training_event" AS ENUM ('started_training', 'finished_training');

-- AlterTable
ALTER TABLE "public"."volunteer_segments" ALTER COLUMN "created_at" SET DATA TYPE TIMESTAMP(6),
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "updated_at" SET DATA TYPE TIMESTAMP(6);

-- CreateTable
CREATE TABLE "public"."volunteer_training_history" (
    "volunteer_training_history_id" BIGSERIAL NOT NULL,
    "volunteer_id" INTEGER NOT NULL,
    "moodle_user_id" INTEGER NOT NULL,
    "event" "public"."volunteer_training_event" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "volunteer_training_history_pkey" PRIMARY KEY ("volunteer_training_history_id")
);

-- AddForeignKey
ALTER TABLE "public"."volunteer_training_history" ADD CONSTRAINT "volunteer_training_history_volunteer_id_fkey" FOREIGN KEY ("volunteer_id") REFERENCES "public"."volunteers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
