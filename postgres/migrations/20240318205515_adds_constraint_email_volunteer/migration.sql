/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `volunteers` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "volunteers_email_key" ON "public"."volunteers"("email");
