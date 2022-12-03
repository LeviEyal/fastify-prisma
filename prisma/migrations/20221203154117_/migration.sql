/*
  Warnings:

  - The primary key for the `Version` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[package,version,laneName,siteName]` on the table `Version` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `Version` DROP PRIMARY KEY;

-- CreateIndex
CREATE UNIQUE INDEX `Version_package_version_laneName_siteName_key` ON `Version`(`package`, `version`, `laneName`, `siteName`);
