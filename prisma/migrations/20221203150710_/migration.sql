/*
  Warnings:

  - The primary key for the `Lane` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Lane` table. All the data in the column will be lost.
  - You are about to drop the column `monitorId` on the `Lane` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Lane` table. All the data in the column will be lost.
  - You are about to drop the column `siteId` on the `Lane` table. All the data in the column will be lost.
  - The primary key for the `Site` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Site` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Site` table. All the data in the column will be lost.
  - The primary key for the `Version` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Version` table. All the data in the column will be lost.
  - You are about to drop the column `laneId` on the `Version` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Version` table. All the data in the column will be lost.
  - You are about to drop the `Monitor` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[siteName]` on the table `Site` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `laneName` to the `Lane` table without a default value. This is not possible if the table is not empty.
  - Added the required column `screenshot_url` to the `Lane` table without a default value. This is not possible if the table is not empty.
  - Added the required column `siteName` to the `Lane` table without a default value. This is not possible if the table is not empty.
  - Added the required column `siteName` to the `Site` table without a default value. This is not possible if the table is not empty.
  - Added the required column `laneName` to the `Version` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Lane` DROP FOREIGN KEY `Lane_monitorId_fkey`;

-- DropForeignKey
ALTER TABLE `Lane` DROP FOREIGN KEY `Lane_siteId_fkey`;

-- DropForeignKey
ALTER TABLE `Version` DROP FOREIGN KEY `Version_laneId_fkey`;

-- AlterTable
ALTER TABLE `Lane` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `monitorId`,
    DROP COLUMN `name`,
    DROP COLUMN `siteId`,
    ADD COLUMN `laneName` VARCHAR(191) NOT NULL,
    ADD COLUMN `screenshot_url` VARCHAR(191) NOT NULL,
    ADD COLUMN `siteName` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`laneName`);

-- AlterTable
ALTER TABLE `Site` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `name`,
    ADD COLUMN `siteName` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`siteName`);

-- AlterTable
ALTER TABLE `Version` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `laneId`,
    DROP COLUMN `name`,
    ADD COLUMN `laneName` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`package`);

-- DropTable
DROP TABLE `Monitor`;

-- CreateIndex
CREATE UNIQUE INDEX `Site_siteName_key` ON `Site`(`siteName`);

-- AddForeignKey
ALTER TABLE `Lane` ADD CONSTRAINT `Lane_siteName_fkey` FOREIGN KEY (`siteName`) REFERENCES `Site`(`siteName`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Version` ADD CONSTRAINT `Version_laneName_fkey` FOREIGN KEY (`laneName`) REFERENCES `Lane`(`laneName`) ON DELETE RESTRICT ON UPDATE CASCADE;
