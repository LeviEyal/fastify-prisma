/*
  Warnings:

  - A unique constraint covering the columns `[laneName,siteName]` on the table `Lane` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Lane_laneName_siteName_key` ON `Lane`(`laneName`, `siteName`);
