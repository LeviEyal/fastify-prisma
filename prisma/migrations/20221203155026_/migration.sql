/*
  Warnings:

  - The primary key for the `Version` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[siteName,laneName]` on the table `Lane` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
-- DROP INDEX `Lane_laneName_siteName_key` ON `Lane`;

-- AlterTable
ALTER TABLE `Version` DROP PRIMARY KEY,
    ADD PRIMARY KEY (`siteName`, `laneName`, `package`);

-- CreateIndex
CREATE UNIQUE INDEX `Lane_siteName_laneName_key` ON `Lane`(`siteName`, `laneName`);
