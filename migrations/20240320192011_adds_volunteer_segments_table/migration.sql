-- CreateTable
CREATE TABLE "public"."volunteer_segments" (
    "volunteer_segment_id" BIGSERIAL NOT NULL,
    "segment_name" VARCHAR(100) NOT NULL,
    "volunteer_id" INTEGER NOT NULL,
    "volunteer_segment_group" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "volunteer_segments_pkey" PRIMARY KEY ("volunteer_segment_id")
);

-- AddForeignKey
ALTER TABLE "public"."volunteer_segments" ADD CONSTRAINT "volunteer_segments_volunteer_id_fkey" FOREIGN KEY ("volunteer_id") REFERENCES "public"."volunteers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
