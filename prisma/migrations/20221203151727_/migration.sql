/*
  Warnings:

  - The primary key for the `Lane` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `siteName` to the `Version` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Version` DROP FOREIGN KEY `Version_laneName_fkey`;

-- AlterTable
ALTER TABLE `Lane` DROP PRIMARY KEY;

-- AlterTable
ALTER TABLE `Version` ADD COLUMN `siteName` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Version` ADD CONSTRAINT `Version_laneName_siteName_fkey` FOREIGN KEY (`laneName`, `siteName`) REFERENCES `Lane`(`laneName`, `siteName`) ON DELETE RESTRICT ON UPDATE CASCADE;
